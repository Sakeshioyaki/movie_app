import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/enum/load_status.dart';
import 'package:movie_app/repositories/up_coming_movie_repository.dart';
import 'package:movie_app/screens/home/Widget/up_coming/up_coming_state.dart';

class UpComingCubit extends Cubit<UpComingState> {
  UpComingMoviesRepository upComingRes;

  UpComingCubit({
    required this.upComingRes,
  }) : super(const UpComingState());

  void fetchInitialUpComingMovies() async {
    emit(state.copyWith(
      loadMovieStatus: LoadStatus.loading,
    ));
    try {
      print('load upcoming 1 ');
      final result = await upComingRes.getUpComingMovies(page: 1);

      // await Future.delayed(const Duration(milliseconds: 3000));
      emit(state.copyWith(
          // dates: result?.dates,
          loadMovieStatus: LoadStatus.success,
          movies: result?.results,
          page: result?.page,
          totalPages: result?.totalPages));
    } catch (e) {
      emit(state.copyWith(loadMovieStatus: LoadStatus.failure));
    }
  }
}
