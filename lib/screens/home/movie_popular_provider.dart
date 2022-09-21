import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/enum/load_status.dart';
import 'package:movie_app/models/trending_movie/trending_movie.dart';
import 'package:movie_app/repositories/trending_movies_repository.dart';

class ListMoviePopularProvider with ChangeNotifier {
  LoadStatus loadStatus = LoadStatus.initial;
  late TrendingMoviesRepository trendingMoviesRepo;
  late TrendingMovie listMovie;

  // ListMoviePopularProvider({required this.trendingMoviesRepo});

  void fetchInitialMovies() async {
    loadStatus = LoadStatus.loading;
    notifyListeners();
    try {
      final result = await trendingMoviesRepo.getTrendingMoviesDay(page: 1);

      if (result != null) {
        print(result.totalPages);
        loadStatus = LoadStatus.success;
        listMovie = result;
        notifyListeners();
      } else {
        print('Sai r');
        loadStatus = LoadStatus.failure;
        notifyListeners();
      }
    } catch (e) {
      loadStatus = LoadStatus.failure;
      notifyListeners();
    }
  }
}
