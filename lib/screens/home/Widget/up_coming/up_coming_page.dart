import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/configs/app_configs.dart';
import 'package:movie_app/enum/load_status.dart';
import 'package:movie_app/models/movie/movie.dart';
import 'package:movie_app/repositories/up_coming_movie_repository.dart';
import 'package:movie_app/screens/home/Widget/up_coming/up_coming_cubit.dart';
import 'package:movie_app/screens/home/Widget/up_coming/up_coming_state.dart';
import 'package:movie_app/screens/movie_detail/movie_detail.dart';

class PageUpComingMovies extends StatelessWidget {
  const PageUpComingMovies({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return UpComingCubit(
            upComingRes: context.read<UpComingMoviesRepository>());
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
  late UpComingCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<UpComingCubit>();
    _cubit.fetchInitialUpComingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpComingCubit, UpComingState>(
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
    return Container(
      height: 220,
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
                  alignment: const Alignment(0, 1.3),
                  child: child,
                );
              }
              return child;
            },
          ),
          itemBuilder: (BuildContext context, int index) {
            return buildCardUpComing(context, index, items);
          },
          itemCount: 10,
          viewportFraction: 0.38,
          scale: 1,
          fade: 0.3),
    );
  }

  Widget buildCardUpComing(BuildContext context, int index, List<Movie> items) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          // do something
          return const MovieDetai();
        }))
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        height: 214,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
              '${AppConfigs.baseUrlImg}${items[index].posterPath}',
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
