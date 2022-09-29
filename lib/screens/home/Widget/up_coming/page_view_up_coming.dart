// import 'package:flutter/material.dart';
// import 'package:movie_app/configs/app_configs.dart';
// import 'package:movie_app/screens/home/movie_up_coming_provider.dart';
// import 'package:movie_app/screens/movie_detail/movie_detail.dart';
//
// class BuildPageViewUpComing extends StatefulWidget {
//   const BuildPageViewUpComing({Key? key}) : super(key: key);
//
//   @override
//   State<BuildPageViewUpComing> createState() => _BuildPageViewUpComingState();
// }
//
// class _BuildPageViewUpComingState extends State<BuildPageViewUpComing> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
//
//   Widget buildCardUpComing(
//       BuildContext context, int index, ListMovieUpComingProvider postMdl) {
//     return GestureDetector(
//       onTap: () => {
//         Navigator.push(context, MaterialPageRoute(builder: (context) {
//           // do something
//           return const MovieDetai();
//         }))
//       },
//       child: Container(
//         alignment: Alignment.bottomCenter,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(30),
//           child: Image.network(
//               '${AppConfigs.baseUrlImg}${postMdl.listMovie?.results?[index].backdropPath}',
//               fit: BoxFit.scaleDown),
//         ),
//       ),
//     );
//   }
// }
