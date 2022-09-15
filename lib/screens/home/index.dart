import 'package:flutter/material.dart';
import 'package:movie_app/common/app_text_styles.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    String name = 'Jane';
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 78),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [Color(0xff4E4376), Color(0xff2B5876)]),
          ),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Container(
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
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.5), width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Image.asset(
                        'assets/icons/search.png',
                        height: 22,
                      ),
                    ),
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          width: 1,
                          height: 35,
                        ),
                        SizedBox(width: 17),
                        Image.asset(
                          'assets/icons/micro.png',
                          height: 22,
                        ),
                        SizedBox(width: 14),
                      ],
                    ),
                    hintText: 'Search',
                    hintStyle: AppTextStyle.whiteS18MediumGrba,
                  ),
                  style: AppTextStyle.whiteS18,
                  onTap: () => {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
