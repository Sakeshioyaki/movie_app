import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/configs/app_configs.dart';
import 'package:movie_app/enum/load_status.dart';
import 'package:movie_app/screens/home/Widget/up_coming/up_coming_controller.dart';
import 'package:movie_app/screens/movie_detail/movie_detail.dart';

class PageUpComingMovies extends StatelessWidget {
  const PageUpComingMovies({
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
  UpComingController controller =
      Get.put<UpComingController>(UpComingController());
  @override
  void initState() {
    controller.fetchInitialTrendingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<UpComingController>(
      initState: (_) async {
        Get.put<UpComingController>(UpComingController());
      },
      builder: (_) {
        if (_.loadMovieStatus.value == LoadStatus.failure) {
          return const Text('faild to load');
        } else if (_.loadMovieStatus.value == LoadStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return buildSuccessList();
        }
      },
    );
  }

  Widget buildSuccessList() {
    final items = Get.find<UpComingController>().listMovieUpComing.value;

    return Container(
      height: 220,
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
                  alignment: const Alignment(0, 1.3),
                  child: child,
                );
              }
              return child;
            },
          ),
          itemBuilder: (BuildContext context, int index) {
            return buildCardUpComing(context, index);
          },
          itemCount: items.length > 10 ? 10 : items.length,
          viewportFraction: 0.38,
          scale: 1,
          fade: 0.3),
    );
  }

  Widget buildCardUpComing(BuildContext context, int index) {
    final items = Get.find<UpComingController>().listMovieUpComing.value;

    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          // do something
          return const MovieDetai();
        }))
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        height: 214,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
              '${AppConfigs.baseUrlImg}${items[index].posterPath}',
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
