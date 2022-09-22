// import 'package:flutter/material.dart';
// import 'package:movie_app/screens/bottom_layout.dart';
// import 'package:movie_app/screens/home/movie_popular_provider.dart';
// import 'package:movie_app/screens/home/movie_up_coming_provider.dart';
// import 'package:provider/provider.dart';
//
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
//           child: const BottomLayout(),
//         ));
//   }
// }
