import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/controllers/global_controller.dart';
import 'package:getxdemo/controllers/home_controller.dart';
import 'package:getxdemo/pages/home_page_widgets.dart/home_list_user.dart';
import 'package:getxdemo/pages/reactive_page.dart';
import 'package:getxdemo/widgets/products_list.dart';

class HomePage extends StatelessWidget {
  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: _controller,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                GetBuilder<GlobalController>(
                    id: 'favorites',
                    builder: (_) => FlatButton(
                        child: Text("Favoritos(${_.getFavorites.length})"),
                        onPressed: null))
              ],
            ),
            body: ReactivePge(),
            //body: ProducList(),
            //body: ListUser(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _.increment();
              },
              child: Icon(Icons.plus_one),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          );
        });
  }
}
