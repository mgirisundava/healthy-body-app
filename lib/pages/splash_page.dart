import 'dart:async';

import 'package:flutter/material.dart';
import 'package:healthy_body_app/pages/bmi_page.dart';
import 'package:healthy_body_app/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    starTimer();
  }

  starTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const BmiPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        color: secondColor,
        child: FittedBox(
          child: Image.asset('assets/images/splash_page_logo.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
