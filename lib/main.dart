import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie/app/modules/splash/splash_binding.dart';
import 'package:the_movie/app/modules/splash/splash_page.dart';
import 'package:the_movie/app/theme/appTheme.dart';
import 'package:the_movie/app/utils/app_translation.dart';
import 'package:the_movie/app/utils/dependency_injection.dart';


void main() {
  DependencyInjection.init();
  runApp( const App());
}

class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home:const SplashPage(),
      initialBinding: SplashBinding(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('es', 'ES'),
      translationsKeys: AppTranslation.translationsKeys,

    );
  }
}