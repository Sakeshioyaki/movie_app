import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/enum/load_status.dart';
import 'package:movie_app/models/up_coming/up_coming_movie.dart';
import 'package:movie_app/repositories/up_coming_movie_repository.dart';

class ListMovieUpComingProvider with ChangeNotifier {
  LoadStatus loadStatus = LoadStatus.initial;
  late UpComingMoviesRepository upComingMoviesRepo;
  late UpComingMovie listMovie;

  void fetchInitialMovies() async {
    loadStatus = LoadStatus.loading;
    notifyListeners();
    try {
      final result = await upComingMoviesRepo.getUpComingMovies(page: 1);

      if (result != null) {
        loadStatus = LoadStatus.success;
        listMovie = result;
        notifyListeners();
      } else {
        loadStatus = LoadStatus.failure;
        notifyListeners();
      }
    } catch (e) {
      loadStatus = LoadStatus.failure;
      notifyListeners();
    }
  }
}
