import 'package:flutter/material.dart';
import 'package:movie_app/common/app_text_styles.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final token = null;

  @override
  Widget build(BuildContext context) {
    // if (token != null) {
    //   options.headers['Authorization'] = 'Bearer ${token.accessToken}';
    // }
    if (token == null) {
      return Center(
        child: TextButton(
          onPressed: () => {},
          child: Container(
            height: 50,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Text(
              'Login',
              style: AppTextStyle.whiteS18Bold.copyWith(fontSize: 23),
            ),
          ),
        ),
      );
    } else {
      return Container(
        child: Text('Da login'),
      );
    }
  }
}
