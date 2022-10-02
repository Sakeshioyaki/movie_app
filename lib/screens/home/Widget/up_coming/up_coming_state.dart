import 'package:equatable/equatable.dart';
import 'package:movie_app/enum/load_status.dart';
import 'package:movie_app/models/movie/movie.dart';

class UpComingState extends Equatable {
  final LoadStatus loadMovieStatus;
  final List<Movie> movies;
  final int page;
  final int totalResults;
  final int totalPages;

  const UpComingState({
    this.loadMovieStatus = LoadStatus.initial,
    this.movies = const [],
    this.page = 1,
    this.totalResults = 0,
    this.totalPages = 0,
  });

  bool get hasReachedMax {
    return page >= totalPages;
  }

  @override
  List<Object?> get props => [
        loadMovieStatus,
        movies,
        page,
        totalResults,
        totalPages,
      ];

  UpComingState copyWith({
    LoadStatus? loadMovieStatus,
    List<Movie>? movies,
    int? page,
    int? totalResults,
    int? totalPages,
  }) {
    return UpComingState(
      loadMovieStatus: loadMovieStatus ?? this.loadMovieStatus,
      movies: movies ?? this.movies,
      page: page ?? this.page,
      totalResults: totalResults ?? this.totalResults,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}
