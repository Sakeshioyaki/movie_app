import 'package:json_annotation/json_annotation.dart';

part 'results.g.dart';

@JsonSerializable()
class Results {
  bool? adult;
  @JsonKey(name: 'total_pages')
  String? backdropPath;
  int? id;
  String? title;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'media_type')
  String? mediaType;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  num? popularity;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  bool? video;
  @JsonKey(name: 'vote_average')
  num? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;

  Results(
      {this.adult,
      this.backdropPath,
      this.id,
      this.title,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.mediaType,
      this.genreIds,
      this.popularity,
      this.releaseDate,
      this.video,
      this.voteAverage,
      this.voteCount});
  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
