import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${_.getUser.firstName} ${_.getUser.lastName}"),
              SizedBox(
                height: 10,
              ),

              /* El widget cupertinoTextField 
              tiene un parámetro onChaged en donde este parámetro 
              debe ser una función que no retorna nada y tiene un string
               como parametro void Function(String) debido a que el 
               método onInputChanged de nuestro controller prácticamente es 
               del mismo tipo requerido del parámetro onChaged se lo puede pasar directamente
                sin la necesidad de usar () del mismo modo el parámetro que recibe onInputChanged 
                es un string en donde en este caso sera el texto escrito en el cupertinoTextField. */

              CupertinoTextField(
                onChanged: _.onInputChanged,
              ),
              SizedBox(
                height: 10,
              ),
              CupertinoButton(
                child: Text("Acpetar"),
                onPressed: () {
                  _.goBackData();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
