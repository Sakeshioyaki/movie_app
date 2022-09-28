import 'package:flutter/material.dart';
import 'package:movie_app/screens/home/aaaaa/a_provider.dart';
import 'package:movie_app/screens/home/bbbbb/b_provider.dart';
import 'package:provider/provider.dart';

class CPage extends StatelessWidget {
  const CPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (create) {
        return AProvider();
      },
      child: const BuildCPage(),
    );
  }
}

class BuildCPage extends StatefulWidget {
  const BuildCPage({Key? key}) : super(key: key);

  @override
  State<BuildCPage> createState() => _BuildCPageState();
}

class _BuildCPageState extends State<BuildCPage> {
  late BProvider pro = context.read<BProvider>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AProvider>(
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
    );
  }
}
