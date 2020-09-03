import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/controllers/reactive_controller.dart';
import 'package:getxdemo/controllers/socket_client_controller.dart';

class ReactivePge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketController = Get.find<SocketClientController>();
    return GetBuilder<ReactiveController>(
        init: ReactiveController(),
        builder: (_) {
          print("Reactive");
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoTextField(onChanged: (text) {
                  return socketController.setSeearchText(text);
                }),
                /* Obx(
                  () => Text("Edad ${(_.myPet.getAge)}"),
                ), */
                Obx(
                  () => Text("Edad ${(socketController.getMessage.value)}"),
                ),
                FlatButton(
                    onPressed: () {
                      _.setPetEdad(_.myPet.getAge * 2);
                    },
                    child: Text("Incremenrar edad")),
              ],
            ),
            /* body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    child: Obx(() {
                      print("Addition");
                      return Text(
                        _.counter.value.toString(),
                        style: TextStyle(fontSize: 30),
                      );
                    }),
                  ),
                  Container(
                    height: 100,
                    child: Obx(() {
                      print("Date");
                      return Text(
                        _.date.value,
                        style: TextStyle(fontSize: 30),
                      );
                    }),
                  ),
                ],
              ),*/

            /*  body: Obx(
                () => ListView.builder(
                  itemCount: _.items.length,
                  itemBuilder: (__, index) {
                    final String text = _.items[index];
                    return ListTile(
                      title: Text(text),
                      trailing: IconButton(
                          onPressed: () => _.rmItem(index),
                          icon: Icon(
                            Icons.delete,
                          )),
                    );
                  },
                ),
              ), */

            // control alt shift editar varias
            //Shift alt a comentart
            /*  body: Obx(() => ListView(
                    children: _.mapItems.values
                        .map((e) => ListTile(
                              title: Text(e),
                              trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    _.rmMapItem(e);
                                  }),
                            ))
                        .toList(),
                  )), */
            /* floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    heroTag: 'add',
                    onPressed: () {
                      //  _.increment();
                      // _.addItem();
                      _.addMaoItem();
                    },
                    child: Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    heroTag: 'tdate',
                    onPressed: () {
                      _.getDate();
                    },
                    child: Icon(Icons.calendar_today),
                  ),
                ],
              ) */
          );
        });
  }
}
