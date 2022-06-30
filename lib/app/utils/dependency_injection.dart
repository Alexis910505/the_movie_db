import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:the_movie/app/data/providers/authentication_api.dart';
import 'package:the_movie/app/data/providers/movie_api.dart';
import 'package:the_movie/app/data/repositories/authentication_repository.dart';
import 'package:the_movie/app/data/repositories/movie_repository.dart';

class DependencyInjection {
  static void init() async {
    Get.lazyPut<Dio>(
     () => Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3')),
    );
    //Providers
    Get.lazyPut<AuthenticationAPI>(() => AuthenticationAPI());
    Get.lazyPut<MovieAPI>(() => MovieAPI());



    // Repositories
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
    Get.lazyPut<MovieRepository>(() => MovieRepository());
  
  }
}
