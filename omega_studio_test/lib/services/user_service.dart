import "package:flutter/material.dart";
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'information_service.dart';

class UserService {
  /// User authentication with email and password
  ///
  /// Upon successful authentication, saves the token
  static void auth(
    String email,
    String password,
    BuildContext context,
  ) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response =
          await dio.post("http://158.160.14.209/api/v1/auth/login", data: {
        'login': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        //! Saving the token for further user login to your account with SharedPreferencies
        final prefs = await SharedPreferences.getInstance();
        debugPrint(
            "accessToken: ${response.data['accessToken']}\nrefreshToken ${response.data['refreshToken']}");

        await prefs.setString(
          'accessToken',
          response.data['accessToken'],
        );
        await prefs.setString(
          'refreshToken',
          response.data['refreshToken'],
        );
        //Message when a successful login occurred
        if (context.mounted) {
          InformationService.showSnackBar(
              context, "Вы успешно вошли в систему");
        }
      }
    } on DioException catch (e) {
      //Show SnackBar when the password or email is incorrect
      if (e.response?.statusCode == 401) {
        if (context.mounted) {
          InformationService.showSnackBar(
              context, e.response!.data["description"]);
        }
      } else {
        //Show SnackBar on another error
        if (context.mounted) {
          InformationService.showSnackBar(context, "Произошла ошибка");
          debugPrint('\x1B[31m$e\x1B[0m');
        }
      }
    }
  }
}
