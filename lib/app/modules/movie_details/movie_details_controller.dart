import 'package:get/get.dart';

class MovieDetailsController extends GetxController {
  RxBool movieFavorite = false.obs;

  onChangedFavorite() {
    movieFavorite.value = !movieFavorite.value;
  }
}
