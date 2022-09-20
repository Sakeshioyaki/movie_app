enum Environment {
  dev,
  stg,
  prod,
}

extension EnvironmentExt on Environment {
  String get envName {
    switch (this) {
      case Environment.dev:
        return 'LOCAL';
      case Environment.stg:
        return 'STAGING';
      case Environment.prod:
        return 'PROD';
    }
  }

  String get baseUrl {
    switch (this) {
      case Environment.dev:
        return "https://api.themoviedb.org/3";
      case Environment.stg:
        return "https://api.themoviedb.org/3";
      case Environment.prod:
        return "https://api.themoviedb.org/3";
    }
  }

  String get baseUrlImg {
    switch (this) {
      case Environment.dev:
        return "https://image.tmdb.org/t/p/original";
      case Environment.stg:
        return "https://image.tmdb.org/t/p/original";
      case Environment.prod:
        return "https://image.tmdb.org/t/p/original";
    }
  }
}
