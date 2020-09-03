import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      dispose: (state) => print("nomal dispose"),
      init: SplashController(),
      builder: (_) => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
