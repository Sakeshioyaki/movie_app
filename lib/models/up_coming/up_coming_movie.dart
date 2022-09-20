import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/models/up_coming/dates.dart';
import 'package:movie_app/models/up_coming/results.dart';

part 'up_coming_movie.g.dart';

@JsonSerializable()
class UpComingMovie {
  Dates? dates;
  int? page;
  List<Results>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  UpComingMovie(
      {this.dates,
      this.page,
      this.results,
      this.totalPages,
      this.totalResults});

  factory UpComingMovie.fromJson(Map<String, dynamic> json) =>
      _$UpComingMovieFromJson(json);
  Map<String, dynamic> toJson() => _$UpComingMovieToJson(this);
}
