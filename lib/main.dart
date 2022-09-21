import 'package:flutter/material.dart';
import 'package:movie_app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: _title,
//         debugShowCheckedModeBanner: false,
//         home: MultiProvider(
//           providers: [
//             Provider<ListMoviePopularProvider>(
//                 create: (_) => ListMoviePopularProvider()),
//             Provider<ListMovieUpComingProvider>(
//                 create: (_) => ListMovieUpComingProvider()),
//           ],
//           child: const BottomApp(),
//         ));
//   }
// }
