import 'package:dio/dio.dart';
import 'package:getxdemo/models/users.dart';

class UsersApi {
  UsersApi._internal();
  // es un constructor privado por eso el _ al hacer esto la clase UsersApi únicamente podrá ser
  // instanceada dentro de la misma clase. _internal() es un nombre genérico la clave es usar el _
  static UsersApi _instance = UsersApi._internal();
  static UsersApi get instance => _instance;
  final _dio = Dio();

  Future<List<User>> getUsers(int page) async {
    try {
      final Response response =
          await this._dio.get('https://reqres.in/api/users', queryParameters: {
        "page": page,
        "delay": 4,
      });
      return (response.data['data'] as List)
          .map((e) => User.fromJson(e))
          .toList();
    } catch (e) {
      print("error +" + e);
      return null;
    }
  }
}
