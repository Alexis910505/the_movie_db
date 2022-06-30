import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:the_movie/app/data/models/movie_model.dart';
import 'package:the_movie/app/utils/Constants.dart';

class MovieAPI {
  final Dio _dio = Get.find<Dio>();
  Logger logger = Logger();

  Future<MovieModel?> popularity(int page) async {
    try {
      final response = await _dio.get(
          '/discover/movie?api_key=${Constants.THE_MOVIE_DB_API_KEY}&sort_by=popularity.asc&include_video=false&page=$page');
    logger.i(response.data);
    if (response.statusCode == 200) {
        return MovieModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  Future<MovieModel?> billboard(int page) async {
    try {
      final response = await _dio.get(
          '/trending/movie/week?api_key=${Constants.THE_MOVIE_DB_API_KEY}');
    logger.i(response.data);
    if (response.statusCode == 200) {
        return MovieModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  Future<MovieModel?> boys(int page) async {
    try {
      final response = await _dio.get(
          '/discover/movie?api_key=${Constants.THE_MOVIE_DB_API_KEY}&sort_by=popularity.asc&include_adult=false&with_genres=28&page=$page');
    logger.i(response.data);
    if (response.statusCode == 200) {
        return MovieModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  Future<MovieModel?> search(String movie,int page) async {
    try {
      final response = await _dio.get(
          'https://api.themoviedb.org/3/search/movie?api_key=${Constants.THE_MOVIE_DB_API_KEY}&query=$movie&page=$page');
    logger.i(response.data);
    if (response.statusCode == 200) {
        return MovieModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }
}
