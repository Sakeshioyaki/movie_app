import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/app_text_styles.dart';
import 'package:movie_app/configs/app_configs.dart';
import 'package:movie_app/enum/load_status.dart';
import 'package:movie_app/models/trending_movie/results.dart';
import 'package:movie_app/screens/home/movie_popular_provider.dart';
import 'package:movie_app/screens/home/page_view_up_coming.dart';
import 'package:movie_app/screens/movie_detail/movie_detail.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoadStatus status = LoadStatus.loading;
  late ListMoviePopularProvider pro;
  @override
  void initState() {
    pro = Provider.of<ListMoviePopularProvider>(context);
    super.initState();
    pro.fetchInitialMovies();
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    String name = 'Jane';
    return Column(
      children: [
        buildHeader(name),
        buildSearch(),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            'Most Popular',
            style: AppTextStyle.whiteS18Bold,
          ),
        ),
        buildPageViewPopular(sizeHeight),
        buildMenu(sizeWidth, sizeHeight),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            'Upcoming releases',
            style: AppTextStyle.whiteS18Bold,
          ),
        ),
        buildPageViewUpComing(),
      ],
    );
  }

  Widget buildPageViewPopular(double sizeHeight) {
    return Consumer<ListMoviePopularProvider>(builder: (context, model, _) {
      return Container(
        height: sizeHeight * 0.18,
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        child: Swiper(
            pagination: const SwiperPagination(alignment: Alignment(0, 1.9)),
            itemBuilder: (BuildContext context, int index) {
              return cardPopular(context, model.listMovie.results?[index]);
            },
            itemCount: model.listMovie.results?.length ?? 0,
            viewportFraction: 0.75,
            scale: 0.85,
            fade: 0.5),
      );
    });
  }

  Widget cardPopular(BuildContext context, Results? results) {
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
            image: NetworkImage(
                '${AppConfigs.baseUrlImg}${results?.backdropPath}'),
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
                    '${results?.title}',
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

  Padding buildMenu(double sizeWidth, double sizeHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.1, vertical: 25),
      child: Row(
        children: [
          Container(
            height: sizeHeight * 0.1025,
            width: sizeWidth * 0.1518,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(color: const Color(0xFFFFFFFF).withOpacity(0.2)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: [
                    const Color(0xffA1F3FE).withOpacity(0.3),
                    const Color(0xffA6A1E0).withOpacity(0.3)
                  ]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/genres.png',
                  height: 31,
                ),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  'Genres',
                  style: AppTextStyle.whiteS9,
                )
              ],
            ),
          ),
          SizedBox(width: sizeWidth * 0.04),
          Container(
            height: sizeHeight * 0.1025,
            width: sizeWidth * 0.1518,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(color: const Color(0xFFFFFFFF).withOpacity(0.2)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: [
                    const Color(0xffA1F3FE).withOpacity(0.3),
                    const Color(0xffA6A1E0).withOpacity(0.3)
                  ]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/tv-series.png',
                  height: 31,
                ),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  'TV series',
                  style: AppTextStyle.whiteS9,
                )
              ],
            ),
          ),
          SizedBox(width: sizeWidth * 0.04),
          Container(
            height: sizeHeight * 0.1025,
            width: sizeWidth * 0.1518,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(color: const Color(0xFFFFFFFF).withOpacity(0.2)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: [
                    const Color(0xffA1F3FE).withOpacity(0.3),
                    const Color(0xffA6A1E0).withOpacity(0.3)
                  ]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/movies.png',
                  height: 31,
                ),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  'Movies',
                  style: AppTextStyle.whiteS9,
                )
              ],
            ),
          ),
          SizedBox(width: sizeWidth * 0.04),
          Container(
            height: sizeHeight * 0.1025,
            width: sizeWidth * 0.1518,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(color: const Color(0xFFFFFFFF).withOpacity(0.2)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: [
                    const Color(0xffA1F3FE).withOpacity(0.3),
                    const Color(0xffA6A1E0).withOpacity(0.3)
                  ]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/Cinema.png',
                  height: 31,
                ),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  'In Theatre',
                  style: AppTextStyle.whiteS9,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          constraints: const BoxConstraints(minHeight: 50, maxHeight: 50),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.white.withOpacity(0.5), width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(15.0))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14),
            child: Image.asset(
              'assets/icons/search.png',
              height: 22,
            ),
          ),
          suffixIcon: Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            // color: Colors.black,
            width: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: const Color.fromRGBO(255, 255, 255, 0.5),
                  width: 1,
                  height: 35,
                ),
                const SizedBox(width: 17),
                Image.asset(
                  'assets/icons/micro.png',
                  height: 22,
                ),
                const SizedBox(width: 14),
              ],
            ),
          ),
          hintText: 'Search',
          hintStyle: AppTextStyle.whiteS18MediumGrba,
          helperStyle: AppTextStyle.whiteS18,
          alignLabelWithHint: false,
        ),
        style: AppTextStyle.whiteS18,
        onTap: () => {},
      ),
    );
  }

  Container buildHeader(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 64),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Hello, ',
                style: AppTextStyle.whiteS18,
              ),
              Text(
                name,
                style: AppTextStyle.whiteS18Bold,
              ),
              Text('!', style: AppTextStyle.whiteS18Bold),
            ],
          ),
          Image.asset(
            'assets/icons/bell.png',
            height: 24,
          ),
        ],
      ),
    );
  }
}
