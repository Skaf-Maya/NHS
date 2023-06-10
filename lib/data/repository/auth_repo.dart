import 'dart:async';
import 'package:get/get.dart';
import 'package:nhs/data/api/api_client.dart';
import 'package:nhs/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> login({required String username, required String password}) async {
    return await apiClient.postData(AppConstants.loginUrl, {"username": username, "password": password});
  }

  Future<Response> updateToken() async {
    return await apiClient.postData(AppConstants.token, {"_method": "put", "cm_firebase_token": ""});
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    return await sharedPreferences.setString(AppConstants.token, token);
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.token);
  }

}
