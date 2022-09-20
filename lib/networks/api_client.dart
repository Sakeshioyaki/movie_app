import 'package:dio/dio.dart';
import 'package:movie_app/models/trending_movie/trending_movie.dart';
import 'package:movie_app/models/up_coming/up_coming_movie.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/trending/movie/{time_window}")
  Future<TrendingMovie> getTrendingMovie(
    @Path("time_window") String timeWindow,
    @Query('api_key') String apiKey,
  );

  @GET("/trending/movie/{time_window}")
  Future<UpComingMovie> getUpComingMovie(
    @Query('api_key') String apiKey, {
    @Query('language') String? language,
    @Query('page') int? page,
    @Query('region') String? region,
  });
}
