import 'package:get/get.dart';
import 'package:the_movie/app/data/models/movie_model.dart';
import 'package:the_movie/app/data/providers/movie_api.dart';

class MovieRepository {
  final MovieAPI _movieAPI = Get.find<MovieAPI>();

  Future<MovieModel?> popularity(int page) =>
      _movieAPI.popularity(page);

  Future<MovieModel?> billboard(int page) =>
      _movieAPI.billboard(page);

  Future<MovieModel?> boys(int page) =>
      _movieAPI.boys(page);

  Future<MovieModel?> search(String value, int page) =>
      _movieAPI.search(value,page);
}