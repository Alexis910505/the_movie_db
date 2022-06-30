import 'package:get/get.dart';
import 'package:the_movie/app/data/repositories/movie_repository.dart';

import '../../data/models/movie_model.dart';

class MovieSearchController extends GetxController {
  final MovieRepository _movieRepository = Get.find<MovieRepository>();
  RxList<Movies> movies = <Movies>[].obs;

  final RxInt _pageNumber = 1.obs;
  final RxInt totalItems = 0.obs;

  RxString search = ''.obs;

  void onChangedSearch(String value) {
    search.value = value;
    searchMovie();
  }

  void searchMovie() async {
    _movieRepository.search(search.value, _pageNumber.value).then((value) {
      if (value == null) {
        movies.value = [];
        totalItems.value = 0;
        return;
      }
      if (_pageNumber.value == 1) {
        movies.value = value.results;
      } else {
        movies.addAll(value.results);
      }
      _pageNumber.value++;
      totalItems.value = movies.length;
    });

    print('Movie Search: $totalItems');
  }
}
