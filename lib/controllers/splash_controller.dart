import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getxdemo/pages/home_page.dart';
import 'package:getxdemo/pages/splash_page.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    Future.delayed(Duration(seconds: 1), () {
      Get.off(
        HomePage(),
        transition: Transition.native,
        duration: Duration(milliseconds: 500),
      );
      // Get.off(SplashPage());
    });
  }
}
