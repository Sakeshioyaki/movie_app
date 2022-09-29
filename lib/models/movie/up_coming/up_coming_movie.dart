import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/models/movie/movie.dart';
import 'package:movie_app/models/movie/up_coming/dates.dart';

part 'up_coming_movie.g.dart';

@JsonSerializable()
class UpComingMovie {
  Dates? dates;
  int? page;
  List<Movie>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_Movie')
  int? totalMovie;

  UpComingMovie(
      {this.dates, this.page, this.results, this.totalPages, this.totalMovie});

  factory UpComingMovie.fromJson(Map<String, dynamic> json) =>
      _$UpComingMovieFromJson(json);
  Map<String, dynamic> toJson() => _$UpComingMovieToJson(this);
}
