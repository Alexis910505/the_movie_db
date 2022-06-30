import 'package:get/get.dart';
import 'package:the_movie/app/data/repositories/authentication_repository.dart';
import 'package:the_movie/app/modules/home/home_binding.dart';
import 'package:the_movie/app/modules/home/home_page.dart';

class SplashController extends GetxController {
  final AuthenticationRepository _authenticationRepository =
      Get.find<AuthenticationRepository>();

  @override
  void onReady() {
    _init();
    super.onReady();
  }

  _init() async {
    await Future.delayed(const Duration(seconds: 2));
    final resul = await _authenticationRepository.newRequestToken();

    if (resul != null) {
      Get.offAll(() => const HomePage(),
          binding: HomeBiding(),);
    }
  }
}
