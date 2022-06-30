import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:the_movie/app/data/models/request_token.dart';
import 'package:the_movie/app/utils/Constants.dart';
import 'package:logger/logger.dart';

class AuthenticationAPI {
  final Dio _dio = Get.find<Dio>();
  Logger logger = Logger();

  Future<RequestToken?> newRequestToken() async {
    try {
      final response = await _dio.get(
        '/authentication/token/new',
        queryParameters: {
          'api_key': Constants.THE_MOVIE_DB_API_KEY,
        },
      );
      logger.i(response.data);
      if (response.statusCode == 200) {
        return RequestToken.fromJson(response.data);
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
