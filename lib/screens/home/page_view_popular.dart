import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/app_text_styles.dart';
import 'package:movie_app/configs/app_configs.dart';
import 'package:movie_app/screens/home/movie_up_coming_provider.dart';
import 'package:movie_app/screens/movie_detail/movie_detail.dart';
import 'package:provider/provider.dart';

class PopularPage extends StatelessWidget {
  const PopularPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (create) {
        return ListMovieUpComingProvider();
      },
      child: const BuildPageViewPopular(),
    );
  }
}

class BuildPageViewPopular extends StatefulWidget {
  const BuildPageViewPopular({Key? key}) : super(key: key);

  @override
  State<BuildPageViewPopular> createState() => _BuildPageViewPopularState();
}

class _BuildPageViewPopularState extends State<BuildPageViewPopular> {
  late ListMovieUpComingProvider pro =
      context.read<ListMovieUpComingProvider>();

  @override
  void initState() {
    pro.updateA();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ListMovieUpComingProvider>(
        builder: (context, provider, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      provider.updateA();
                    },
                    child: Text(provider.a.toString())),
                GestureDetector(
                    onTap: () {
                      provider.updateA();
                    },
                    child: Container(
                        height: 50,
                        width: 100,
                        color: Colors.red,
                        child: Text(provider.a.toString()))),
                GestureDetector(
                    onTap: () {
                      provider.updateA();
                    },
                    child: Text(provider.a.toString())),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget cardBuild(BuildContext context, int index, String path, String title) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const MovieDetai();
        }))
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            image: NetworkImage('${AppConfigs.baseUrlImg}$path'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Color(0xff121212)
                ]),
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(left: 26, bottom: 15, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.whiteS18Bold,
                  ),
                ),
                Container(
                  height: 14,
                  width: 45,
                  decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/imgs/imdb.png',
                        height: 5,
                      ),
                      Text(
                        '8.5',
                        style: AppTextStyle.blackS6Bold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
