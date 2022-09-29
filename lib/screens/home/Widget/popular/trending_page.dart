import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/app_text_styles.dart';
import 'package:movie_app/configs/app_configs.dart';
import 'package:movie_app/enum/load_status.dart';
import 'package:movie_app/models/movie/movie.dart';
import 'package:movie_app/repositories/trending_movies_repository.dart';
import 'package:movie_app/screens/home/Widget/popular/trending_cubit.dart';
import 'package:movie_app/screens/home/Widget/popular/trending_state.dart';
import 'package:movie_app/screens/home/Widget/popular/widget/movie_widget.dart';
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
    final trendingRepo =
        RepositoryProvider.of<TrendingMoviesRepository>(context);
    _cubit = TrendingCubit(
      trendingRes: trendingRepo,
    );
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
          // Navigate to next screen
          // showDialog(
          //     context: context,
          //     builder: (context) {
          //       return Center(child: CircularProgressIndicator());
          //     });
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
          return Text('faild to load');
        } else if (state.loadMovieStatus == LoadStatus.loading) {
          print('loading');

          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          // print('successssssssss');
          // Navigator.pop(context);
          return buildSuccessList(
            state.movies,
          );
        }
      },
    );
  }

  Widget buildSuccessList(List<Movie> items) {
    return RefreshIndicator(
      onRefresh: _onRefreshData,
      child: GridView.builder(
        // controller: _scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemBuilder: (context, index) {
          final item = items[index];
          return MovieWidget(
            movie: item,
            onPressed: () {
              print('() => MovieDetailPage(movie: item)');
            },
          );
        },
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 3 / 4,
        ),
        // controller: _scrollController,
      ),
    );
  }

  // Widget buildLoadingList() {
  //   return const Center(
  //     child: Text('loading lisstttttt '),
  //   );
  // }

  // Future<void> _onRefreshData() async {
  //   _cubit.fetchInitialTrendingMovies();
  // }

  Future<void> _onRefreshData() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _cubit.fetchInitialTrendingMovies();
  }
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
          padding: const EdgeInsets.only(left: 26, bottom: 15, right: 16),
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
