import 'dart:async';
import 'package:faker/faker.dart';
import 'package:get/state_manager.dart';

class SocketClientController extends GetxController {
  Timer _timer;
//  Timer _timerCounter;
  RxInt _counter = 0.obs;
  RxString _searchText = "".obs;
  RxString _message = "".obs;
  final _faker = new Faker();

  RxString get getMessage => _message;
  @override
  void onInit() {
    super.onInit();
    _init();
  }

  _init() {
    // workers
    //Ever cada vez
    /* ever(_searchText, (_) {
      print("allal");
    }); */

    /*  ever(_counter, (_) {
      print("Counter has been changed ${_counter.value}");
    }); */

    //once una sola vez
    /*  once(_counter, (_) {
      print("Una sola vez ${_counter.value}");
    }); */

    //debounce despues de cierto tiempo
    debounce(_searchText, (_) {
      print(_searchText.value + "Debounde");
    }, time: Duration(milliseconds: 500));

    //interval
    // cada cierto intervalo
    /* interval(_searchText, (_) {
      print(_searchText.value + " en interval");
    }, time: Duration(microseconds: 500)); */

    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        _message.value = faker.lorem.sentence();
      },
    );
    /*  _timerCounter = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        _counter.value++;
      },
    ); */
  }

  void setSeearchText(String text) {
    _searchText.value = text;
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer.cancel();
    }
    /* if (_timerCounter != null) {
      _timerCounter.cancel();
    } */
    super.onClose();
  }
}
