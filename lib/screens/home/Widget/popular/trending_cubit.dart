import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/enum/load_status.dart';
import 'package:movie_app/repositories/trending_movies_repository.dart';
import 'package:movie_app/screens/home/Widget/popular/trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingMoviesRepository trendingRes;

  TrendingCubit({
    required this.trendingRes,
  }) : super(const TrendingState());

  void fetchInitialTrendingMovies() async {
    emit(state.copyWith(
      loadMovieStatus: LoadStatus.loading,
    ));
    try {
      final result = await trendingRes.getTrendingMoviesDay(page: 1);
      await Future.delayed(const Duration(milliseconds: 3000));
      emit(state.copyWith(
          loadMovieStatus: LoadStatus.success,
          movies: result?.results,
          page: result?.page,
          totalPages: result?.totalPages));
    } catch (e) {
      emit(state.copyWith(loadMovieStatus: LoadStatus.failure));
    }
  }
}
