import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie/app/global_widgets/progress_widget.dart';
import 'package:the_movie/app/modules/splash/splash_controller.dart';
 
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => const Scaffold(
        body: ProgressWidget(),
      ),
    );
  }
}


