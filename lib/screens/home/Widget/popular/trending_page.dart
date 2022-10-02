import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/app_text_styles.dart';
import 'package:movie_app/configs/app_configs.dart';
import 'package:movie_app/enum/load_status.dart';
import 'package:movie_app/models/movie/movie.dart';
import 'package:movie_app/repositories/trending_movies_repository.dart';
import 'package:movie_app/screens/home/Widget/popular/trending_cubit.dart';
import 'package:movie_app/screens/home/Widget/popular/trending_state.dart';
import 'package:movie_app/screens/movie_detail/movie_detail.dart';

class PageTrendingMovies extends StatelessWidget {
  const PageTrendingMovies({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return TrendingCubit(
          trendingRes: context.read<TrendingMoviesRepository>(),
        );
      },
      child: const MoviesChildPage(),
    );
  }
}

class MoviesChildPage extends StatefulWidget {
  const MoviesChildPage({Key? key}) : super(key: key);

  @override
  State<MoviesChildPage> createState() => _MoviesChildPageState();
}

class _MoviesChildPageState extends State<MoviesChildPage> {
  late TrendingCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<TrendingCubit>();
    _cubit.fetchInitialTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrendingCubit, TrendingState>(
      bloc: _cubit,
      listenWhen: (pre, current) {
        print('${pre.loadMovieStatus} -- ${current.loadMovieStatus}');
        return current.loadMovieStatus == LoadStatus.loading ||
            current.loadMovieStatus == LoadStatus.success;
      },
      listener: (context, state) {
        if (state.loadMovieStatus == LoadStatus.loading) {
          print('loadingggggggg .....');
        } else if (state.loadMovieStatus == LoadStatus.success) {
          // Report to analytics
          print('Succcess.....');
        } else {
          print('check else ${state.loadMovieStatus.name} -- ');
        }
      },
      buildWhen: (pre, state) {
        return state.loadMovieStatus == LoadStatus.success ||
            state.loadMovieStatus == LoadStatus.loading ||
            state.loadMovieStatus == LoadStatus.failure;
      },
      builder: (context, state) {
        if (state.loadMovieStatus == LoadStatus.failure) {
          return const Text('faild to load');
        } else if (state.loadMovieStatus == LoadStatus.loading) {
          print('loading');
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return buildSuccessList(
            state.movies,
          );
        }
      },
    );
  }

  Widget buildSuccessList(List<Movie> items) {
    double sizeHeight = MediaQuery.of(context).size.height;
    return RefreshIndicator(
      onRefresh: _onRefreshData,
      child: Container(
        height: sizeHeight * 0.18,
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        child: Swiper(
            pagination: SwiperCustomPagination(
              builder: (BuildContext context, SwiperPluginConfig config) {
                Widget child = Container(
                  // margin: ,
                  child: DotSwiperPaginationBuilder(
                    color: Colors.white.withOpacity(0.3),
                    size: 8,
                    space: 5,
                    activeColor: const Color(0xff64ABDB),
                  ).build(context, config),
                );
                if (!config.outer!) {
                  child = Align(
                    alignment: const Alignment(0, 1.5),
                    child: child,
                  );
                }
                return child;
              },
            ),
            itemBuilder: (BuildContext context, int index) {
              return cardBuild(context, index, items);
            },
            itemCount: 10,
            viewportFraction: 0.75,
            scale: 0.85,
            fade: 0.5),
      ),
    );
  }

  Widget cardBuild(BuildContext context, int index, List<Movie> items) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const MovieDetai();
        }))
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            image: NetworkImage(
                '${AppConfigs.baseUrlImg}${items[index].backdropPath}'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Color(0xff121212)
                ]),
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(left: 26, bottom: 15, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${items[index].title}',
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.whiteS18Bold,
                  ),
                ),
                Container(
                  height: 14,
                  width: 45,
                  decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/imgs/imdb.png',
                        height: 5,
                      ),
                      Text(
                        '8.5',
                        style: AppTextStyle.blackS6Bold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onRefreshData() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _cubit.fetchInitialTrendingMovies();
  }

  @override
  bool get wantKeepAlive => true;
}

Widget cardBuild(BuildContext context, int index, String path, String title) {
  return GestureDetector(
    onTap: () => {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const MovieDetai();
      }))
    },
    child: Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: NetworkImage('${AppConfigs.baseUrlImg}$path'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.transparent,
                Color(0xff121212)
              ]),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(
            left: 26,
            bottom: 15,
            right: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.whiteS18Bold,
                ),
              ),
              Container(
                height: 14,
                width: 45,
                decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/imgs/imdb.png',
                      height: 5,
                    ),
                    Text(
                      '8.5',
                      style: AppTextStyle.blackS6Bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
