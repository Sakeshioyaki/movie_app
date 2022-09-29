import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/networks/api_client.dart';
import 'package:movie_app/networks/api_util.dart';
import 'package:movie_app/repositories/trending_movies_repository.dart';
import 'package:movie_app/repositories/up_coming_movie_repository.dart';
import 'package:movie_app/screens/bottom_layout.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      child: Container(
        color: Colors.red,
        child: const BottomLayout(),
      ),
    );
  }
}
