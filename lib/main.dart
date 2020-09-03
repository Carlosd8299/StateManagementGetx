import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/controllers/global_controller.dart';
import 'package:getxdemo/controllers/socket_client_controller.dart';
import 'package:getxdemo/pages/home_page.dart';
import 'package:getxdemo/pages/profile_page.dart';
import 'package:getxdemo/pages/reactive_page.dart';
import 'package:getxdemo/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Definiendo un controlador Global
    Get.put(GlobalController());
    //Definiendo un controlador Global Reactivo
    Get.put(SocketClientController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      //home: SplashPage(),
      //home: HomePage(),
    );
  }
}
