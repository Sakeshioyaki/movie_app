import 'package:get/get.dart';
import 'package:movie_app/configs/app_configs.dart';
import 'package:movie_app/models/movie/trending_movie/trending_movie.dart';
import 'package:movie_app/models/movie/up_coming/up_coming_movie.dart';
import 'package:movie_app/networks/api_client.dart';

class APIService extends GetxService {
  late ApiClient apiClient;

  APIService({required this.apiClient});

  Future<APIService> init() async {
    return this;
  }

  Future<TrendingMovie?> getTrendingMoviesDay({int? page}) async {
    return await apiClient.getTrendingMovie('day', MovieAPIConfig.apiKey,
        page: page);
  }

  Future<UpComingMovie?> getUpComingMovies({int? page}) async {
    return await apiClient.getUpComingMovie(MovieAPIConfig.apiKey, page);
  }
}
