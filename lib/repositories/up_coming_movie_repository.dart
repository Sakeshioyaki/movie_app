import 'package:movie_app/configs/app_configs.dart';
import 'package:movie_app/models/up_coming/up_coming_movie.dart';
import 'package:movie_app/networks/api_client.dart';

abstract class UpComingMoviesRepository {
  Future<UpComingMovie?> getUpComingMovies({required int page});
}

class UpComingMoviesImpl extends UpComingMoviesRepository {
  ApiClient apiClient;

  UpComingMoviesImpl({required this.apiClient});

  @override
  Future<UpComingMovie?> getUpComingMovies({int? page}) async {
    return apiClient.getUpComingMovie(MovieAPIConfig.apiKey, page: page);
  }
}
