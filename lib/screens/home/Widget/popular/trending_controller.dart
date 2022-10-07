import 'dart:core';

import 'package:get/get.dart';
import 'package:movie_app/Sevices/APIService.dart';
import 'package:movie_app/enum/load_status.dart';
import 'package:movie_app/models/movie/movie.dart';

class TrendingController extends GetxController {
  final service = Get.find<APIService>();
  Rx<LoadStatus> loadMovieStatus = Rx<LoadStatus>(LoadStatus.initial);
  Rx<List<Movie>> listMovieTrending = Rx<List<Movie>>([]);
  RxInt page = RxInt(1);
  RxInt totalPages = RxInt(1);

  void fetchInitialTrendingMovies() async {
    loadMovieStatus.value = LoadStatus.loading;
    try {
      final result = await service.getTrendingMoviesDay(page: 1);
      loadMovieStatus.value = LoadStatus.success;
      listMovieTrending.value = result?.results ?? [];
      page.value = result?.page ?? 1;
      totalPages.value = result?.totalPages ?? 1;
    } catch (e) {
      loadMovieStatus.value = LoadStatus.failure;
    }
  }
}
