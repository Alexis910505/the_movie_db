import 'package:get/get.dart';
import 'package:the_movie/app/modules/movie_search/movie_search_controller.dart';

class MovieSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieSearchController());
  }
}
