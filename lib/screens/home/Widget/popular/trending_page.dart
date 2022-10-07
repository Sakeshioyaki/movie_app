import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/common/app_text_styles.dart';
import 'package:movie_app/configs/app_configs.dart';
import 'package:movie_app/enum/load_status.dart';
import 'package:movie_app/screens/home/Widget/popular/trending_controller.dart';
import 'package:movie_app/screens/movie_detail/movie_detail.dart';

class PageTrendingMovies extends StatelessWidget {
  const PageTrendingMovies({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MoviesChildPage();
  }
}

class MoviesChildPage extends StatefulWidget {
  const MoviesChildPage({Key? key}) : super(key: key);

  @override
  State<MoviesChildPage> createState() => _MoviesChildPageState();
}

class _MoviesChildPageState extends State<MoviesChildPage> {
  TrendingController controller =
      Get.put<TrendingController>(TrendingController());
  @override
  void initState() {
    controller.fetchInitialTrendingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<TrendingController>(
      builder: (_) => _.loadMovieStatus.value == LoadStatus.loading
          ? const CircularProgressIndicator()
          : buildSuccessList(),
    );
  }

  Widget buildSuccessList() {
    double sizeHeight = MediaQuery.of(context).size.height;
    return RefreshIndicator(
      onRefresh: _onRefreshData,
      child: Container(
        height: sizeHeight * 0.18,
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        child: Swiper(
            pagination: SwiperCustomPagination(
              builder: (BuildContext context, SwiperPluginConfig config) {
                Widget child = Container(
                  // margin: ,
                  child: DotSwiperPaginationBuilder(
                    color: Colors.white.withOpacity(0.3),
                    size: 8,
                    space: 5,
                    activeColor: const Color(0xff64ABDB),
                  ).build(context, config),
                );
                if (!config.outer!) {
                  child = Align(
                    alignment: const Alignment(0, 1.5),
                    child: child,
                  );
                }
                return child;
              },
            ),
            itemBuilder: (BuildContext context, int index) {
              return cardBuild(context, index);
            },
            itemCount: 10,
            viewportFraction: 0.75,
            scale: 0.85,
            fade: 0.5),
      ),
    );
  }

  Widget cardBuild(BuildContext context, int index) {
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
                '${AppConfigs.baseUrlImg}${controller.listMovieTrending.value[index].backdropPath}'),
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
                    '${controller.listMovieTrending.value[index].title}',
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

  Future<void> _onRefreshData() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    Get.find<TrendingController>().fetchInitialTrendingMovies();
  }

  @override
  bool get wantKeepAlive => true;
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
          padding: const EdgeInsets.only(
            left: 26,
            bottom: 15,
            right: 16,
          ),
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
