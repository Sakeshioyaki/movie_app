import 'package:flutter/material.dart';
import 'package:movie_app/common/app_text_styles.dart';
import 'package:movie_app/screens/home/Widget/popular/trending_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    String name = 'Jane';
    return SingleChildScrollView(
      child: Column(
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
          buildTrendingMovies(),
          buildMenu(sizeWidth, sizeHeight),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              'Upcoming releases',
              style: AppTextStyle.whiteS18Bold,
            ),
          ),
          // const BuildPageViewUpComing(),
        ],
      ),
    );
  }

  Padding buildMenu(double sizeWidth, double sizeHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.1, vertical: 25),
      child: Row(
        children: const [
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }

  Widget buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          constraints: const BoxConstraints(minHeight: 50, maxHeight: 50),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.white.withOpacity(0.5), width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
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

  Widget buildTrendingMovies() {
    return const PageTrendingMovies();
  }
}
