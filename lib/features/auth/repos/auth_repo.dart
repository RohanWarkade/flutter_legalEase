import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_legalease/features/auth/models/user_model.dart';
import 'package:flutter_legalease/core/config.dart';

class AuthRepo {
  static Future<UserModel?> getUserRepo(String uid) async {
    try {
      Dio dio = Dio();

      final response = await dio.get(Config.ServerUrl + "user/$uid");
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        UserModel userModel = UserModel.fromMap(response.data);
        return userModel;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> createUserRepo(UserModel userModel) async {
    Dio dio = Dio();
    final response = await dio.post(Config.ServerUrl + "user");
    if (response.statusCode! >= 200 && response.statusCode! <= 300) {
      return true;
    } else {
      return false;
    }
  }
}
