import 'package:get/get.dart';
import 'package:meta/meta.dart';

class RxPet {
  final RxString nombre;
  final RxInt edad;

  RxPet({
    @required this.nombre,
    @required this.edad,
  });
}

//RX Significa reactivo
class Pet {
  RxPet rx;

  Pet({@required String nombre, @required int edad}) {
    this.rx = RxPet(nombre: nombre.obs, edad: edad.obs);
  }

  String get getName {
    this.rx.nombre.value;
  }

  int get getAge {
    this.rx.edad.value;
  }

  void setName(String va) {
    this.rx.nombre.value = va;
  }

  void setAge(int va) {
    this.rx.edad.value = va;
  }
  /*  Pet copyWith({String nombre, int edad}) {
    return Pet(
      edad: edad ?? this.edad,
      nombre: nombre ?? this.nombre,
    );
  } */
}
