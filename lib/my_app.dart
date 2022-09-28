import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/networks/api_client.dart';
import 'package:movie_app/networks/api_util.dart';
import 'package:movie_app/repositories/trending_movies_repository.dart';
import 'package:movie_app/repositories/up_coming_movie_repository.dart';
import 'package:movie_app/screens/home/aaaaa/a_page.dart';
import 'package:movie_app/screens/home/aaaaa/a_provider.dart';
import 'package:movie_app/screens/home/bbbbb/b_provider.dart';
import 'package:movie_app/screens/home/c/c_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ApiClient _apiClient;

  @override
  void initState() {
    _apiClient = ApiUtil.apiClient;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TrendingMoviesRepository>(create: (context) {
          return TrendingMoviesImpl(apiClient: _apiClient);
        }),
        RepositoryProvider<UpComingMoviesRepository>(create: (context) {
          return UpComingMoviesImpl(apiClient: _apiClient);
        }),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (create) {
              return AProvider();
            },
          ),
          ChangeNotifierProvider(
            create: (create) {
              return BProvider();
            },
          ),
          ChangeNotifierProvider(
            create: (create) {
              return CProvider();
            },
          ),
        ],
        child: const MaterialApp(
          home: APage(),
        ),
      ),
    );
  }
}
