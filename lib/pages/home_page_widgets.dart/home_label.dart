import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getxdemo/controllers/home_controller.dart';

class HomeLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'text', builder: (_) => Text(_.getCounter.toString()));
  }
}
