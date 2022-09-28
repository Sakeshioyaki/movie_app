import 'package:flutter/material.dart';
import 'package:movie_app/screens/home/aaaaa/a_provider.dart';
import 'package:movie_app/screens/home/bbbbb/b_provider.dart';
import 'package:provider/provider.dart';

import '../../../enum/load_status.dart';

class BPage extends StatefulWidget {
  const BPage({Key? key}) : super(key: key);

  @override
  State<BPage> createState() => _BPageState();
}

class _BPageState extends State<BPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('B page'),
        ),
        body: Consumer2<AProvider, BProvider>(
          builder: (context, provider, bProvider, child) {
            return Center(
              child: GestureDetector(
                onTap: () {
                  provider.increment();
                },
                child: Column(
                  children: [
                    Center(
                      child: provider.loadStatus == LoadStatus.loading
                          ? const CircularProgressIndicator()
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                      'text from B  is    ${bProvider.count}'),
                                ),
                                SizedBox(height: 50),
                                GestureDetector(
                                  onTap: () {
                                    bProvider.increment();
                                    // Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    color: Colors.red,
                                    child: const Text('click to update  B'),
                                  ),
                                ),
                                SizedBox(height: 50),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const BPage();
                                    }));
                                    // Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    color: Colors.greenAccent,
                                    child: const Text('click to go to B page'),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      color: Colors.red,
                      child: Text('data ${provider.a}'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
