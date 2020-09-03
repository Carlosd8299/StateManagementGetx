import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getxdemo/models/users.dart';

class ProfileController extends GetxController {
  User _user;
  User get getUser => _user;
  String _inputText = "";

  @override
  void onInit() {
    super.onInit();
    this._user = Get.arguments as User;
  }

  void onInputChanged(String text) {
    this._inputText = text;
  }

  void goBackData() {
    if (this._inputText.trim().length > 0) {
      Get.back(result: this._inputText);
    } else {
      showCupertinoModalPopup(
        context: Get.overlayContext,
        builder: (context) => CupertinoActionSheet(
          title: Text("Error"),
          message: Text("Complete el campo"),
          cancelButton: CupertinoActionSheetAction(
              onPressed: () => Get.back(), child: Text("Aceptar")),
        ),
      );
      /*
      Get.dialog(AlertDialog(
        title: Text("Eror"),
        content: Text("Ingrese algo"),
        actions: [
          FlatButton(
              onPressed: () {
                Get.back(result: this._inputText);
              },
              child: Text("Aceptar"))
        ],
      ));*/
    }
  }
}
