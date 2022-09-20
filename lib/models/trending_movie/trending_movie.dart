import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/models/trending_movie/results.dart';

part 'trending_movie.g.dart';

@JsonSerializable()
class TrendingMovie {
  int? page;
  List<Results>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  TrendingMovie({this.page, this.results, this.totalPages, this.totalResults});

  factory TrendingMovie.fromJson(Map<String, dynamic> json) =>
      _$TrendingMovieFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingMovieToJson(this);
}
