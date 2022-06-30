import 'package:get/get.dart';
import 'package:the_movie/app/data/models/request_token.dart';
import 'package:the_movie/app/data/providers/authentication_api.dart';

class AuthenticationRepository {
  final AuthenticationAPI _authenticationAPI = Get.find<AuthenticationAPI>();

  Future<RequestToken?> newRequestToken() =>
      _authenticationAPI.newRequestToken();
}
