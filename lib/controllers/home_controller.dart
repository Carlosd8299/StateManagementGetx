import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getxdemo/api/users_api.dart';
import 'package:getxdemo/models/users.dart';
import 'package:getxdemo/pages/profile_page.dart';

class HomeController extends GetxController {
  int _counter = 0;
  List<User> _user = [];
  bool _loading = true;

  int get getCounter => _counter;
  List<User> get getUsers => _user;
  bool get getLoading => _loading;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("Hola");
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print(" readyHola");
    this.loadUser();
  }

  void increment() {
    this._counter++;
    update(['text'], _counter >= 10);
  }

  Future<void> loadUser() async {
    final data = await UsersApi.instance.getUsers(1);
    this._user = data;
    this._loading = false;
    update(['users']);
  }

  Future<void> showUserProfile(User user) async {
    final result = await Get.to<String>(
      ProfilePage(),
      arguments: user,
    );
    if (result != null) {
      print("result $result");
    }
  }
}
