import 'package:flutter/material.dart';
import 'package:movie_app/common/app_text_styles.dart';
import 'package:movie_app/configs/app_configs.dart';
import 'package:movie_app/screens/home/aaaaa/a_provider.dart';
import 'package:movie_app/screens/home/bbbbb/b_page.dart';
import 'package:movie_app/screens/movie_detail/movie_detail.dart';
import 'package:provider/provider.dart';

class APage extends StatefulWidget {
  const APage({Key? key}) : super(key: key);

  @override
  State<APage> createState() => _APageState();
}

class _APageState extends State<APage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('A page'),
        ),

        body: Column(
          children: [
            Consumer<AProvider>(
              builder: (context, provider, child) {
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      provider.increment();
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      color: Colors.red,
                      child: Text('data ${provider.a}'),
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const BPage();
                }))
              },
              child: Container(
                height: 50,
                width: 100,
                color: Colors.blue,
              ),
            ),
          ],
        ),

        // body: Center(
        //   child: Widget.aProvider.loadStatus == LoadStatus.loading
        //       ? const CircularProgressIndicator()
        //       : Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Container(
        //               child: Text('text from A  is    ${aProvider.a}'),
        //             ),
        //             SizedBox(height: 50),
        //             GestureDetector(
        //               onTap: () {
        //                 aProvider.increment();
        //                 // Navigator.of(context).pop();
        //               },
        //               child: Container(
        //                 height: 50,
        //                 width: 100,
        //                 color: Colors.red,
        //                 child: const Text('click to update  A'),
        //               ),
        //             ),
        //             SizedBox(height: 50),
        //             GestureDetector(
        //               onTap: () {
        //                 Navigator.push(context,
        //                     MaterialPageRoute(builder: (context) {
        //                   return const BPage();
        //                 }));
        //                 // Navigator.of(context).pop();
        //               },
        //               child: Container(
        //                 height: 50,
        //                 width: 100,
        //                 color: Colors.greenAccent,
        //                 child: const Text('click to go to B page'),
        //               ),
        //             ),
        //           ],
        //         ),
        // ),
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
