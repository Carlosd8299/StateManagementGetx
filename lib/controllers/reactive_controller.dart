import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/controllers/socket_client_controller.dart';
import 'package:getxdemo/models/pet.dart';

class ReactiveController extends GetxController {
  RxInt counter = 0.obs;
  RxString date = ''.obs;
  RxList<String> items = List<String>().obs;
  RxMap<String, dynamic> mapItems = Map<String, dynamic>().obs;
  StreamSubscription _streamSubscription;

  Pet myPet = Pet(nombre: "null", edad: 1);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final SocketClientController socketClientCOntroller =
        Get.find<SocketClientController>();
    _streamSubscription = socketClientCOntroller.getMessage.listen((data) {
      //    print("Mensjae::: $data");
    });
  }

  void increment() {
    counter.value++;
  }

  @override
  void onClose() {
    _streamSubscription?.cancel();
    super.onClose();
  }

  void getDate() {
    date.value = DateTime.now().toString();
  }

  void addItem() {
    items.add(DateTime.now().toString());
  }

  void rmItem(int index) {
    items.removeAt(index);
  }

  void addMaoItem() {
    final String key = DateTime.now().toString();
    mapItems.add(key, key);
  }

  void rmMapItem(String key) {
    mapItems.remove(key);
  }

  void setPetEdad(int edad) {
    myPet.setAge(edad);
    //myPet.value = myPet.value.copyWith(edad: edad);
  }
}
