import 'package:flutter/material.dart';
import 'package:movie_app/networks/api_client.dart';
import 'package:movie_app/networks/api_util.dart';
import 'package:movie_app/screens/bottom_layout.dart';
import 'package:movie_app/screens/home/movie_popular_provider.dart';
import 'package:movie_app/screens/home/movie_up_coming_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
    return MultiProvider(
      providers: [
        Provider<ListMoviePopularProvider>(
            create: (context) => ListMoviePopularProvider()),
        Provider<ListMovieUpComingProvider>(
            create: (context) => ListMovieUpComingProvider()),
      ],
      child: const BottomLayout(),
    );
  }
}
