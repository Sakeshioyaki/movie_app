import 'package:movie_app/configs/app_configs.dart';
import 'package:movie_app/models/trending_movie/trending_movie.dart';
import 'package:movie_app/networks/api_client.dart';

abstract class TrendingMoviesRepository {
  Future<TrendingMovie?> getTrendingMoviesDay({required int page});
}

class TrendingMoviesImpl extends TrendingMoviesRepository {
  ApiClient apiClient;

  TrendingMoviesImpl({required this.apiClient});

  @override
  Future<TrendingMovie?> getTrendingMoviesDay({int? page}) async {
    return apiClient.getTrendingMovie('day', MovieAPIConfig.apiKey, page: page);
  }
}
