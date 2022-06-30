import 'package:get/get.dart';
import 'package:the_movie/app/modules/home/home_controller.dart';

class HomeBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
