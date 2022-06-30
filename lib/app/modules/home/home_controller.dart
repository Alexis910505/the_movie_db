import 'package:get/get.dart';
import 'package:the_movie/app/data/models/movie_model.dart';
import 'package:the_movie/app/data/repositories/movie_repository.dart';

class HomeController extends GetxController {
  final MovieRepository _movieRepository = Get.find<MovieRepository>();

  RxList<Movies> moviesPopularity = <Movies>[].obs;
  RxList<Movies> moviesBillboard = <Movies>[].obs;
  RxList<Movies> moviesBoys = <Movies>[].obs;
  RxInt position = (-1).obs;
  RxBool loading = true.obs;

  final RxInt _pageNumberPopularity = 1.obs;
  final RxInt totalItemsPopularity = 0.obs;

  final RxInt _pageNumberBillboard = 1.obs;
  final RxInt totalItemsBillboard = 0.obs;

  final RxInt _pageNumberBoys = 1.obs;
  final RxInt totalItemsBoys = 0.obs;

  @override
  void onInit() {
    popularity();
    super.onInit();
  }

  void popularity() async {
    position.value = 0;
    final result =
        await _movieRepository.popularity(_pageNumberPopularity.value);
    if (result == null) {
      return;
    }
    if (_pageNumberPopularity.value == 1) {
      moviesPopularity.value = result.results;
    } else {
      moviesPopularity.addAll(result.results);
    }
    _pageNumberPopularity.value++;
    totalItemsPopularity.value = moviesPopularity.length;
    loading.value = false;

    print('Movie Popularity: $totalItemsPopularity');
  }

  void billboard() async {
    position.value = 1;
    final result = await _movieRepository.billboard(_pageNumberBillboard.value);

    if (result == null) {
      return;
    }
    if (_pageNumberBillboard.value == 1) {
      moviesBillboard.value = result.results;
    } else {
      moviesBillboard.addAll(result.results);
    }
    _pageNumberBillboard.value++;
    totalItemsBillboard.value = moviesBillboard.length;
    print('Movie Billboard: $totalItemsBillboard');
  }

  void boys() async {
    position.value = 2;
    final result = await _movieRepository.boys(_pageNumberBoys.value);

    if (result == null) {
      return;
    }

    if (_pageNumberBoys.value == 1) {
      moviesBoys.value = result.results;
    } else {
      moviesBoys.addAll(result.results);
    }
    _pageNumberBoys.value++;
    totalItemsBoys.value = moviesBoys.length;
    print('Movie Boys: $totalItemsBoys');
  }
}
