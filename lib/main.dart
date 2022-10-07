import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/Sevices/APIService.dart';
import 'package:movie_app/networks/api_client.dart';
import 'package:movie_app/networks/api_util.dart';
import 'package:movie_app/screens/bottom_layout.dart';
import 'package:provider/provider.dart';

Future initService() async {
  ApiClient apiClient = ApiUtil.apiClient;
  await Get.putAsync(() => APIService(apiClient: apiClient).init());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initService();
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const BottomLayout(),
    );
  }
}
