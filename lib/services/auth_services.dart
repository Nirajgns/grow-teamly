import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:profileapp/constants/api_endpoints.dart';
import 'package:profileapp/core/header.dart';
import 'package:profileapp/core/network_client.dart';
import 'package:profileapp/models/login_response_model.dart';

class AuthServices {
  Future<LoginResponseModel?> login(String username, String password) async {  //!login is just a function
    final http.Response? response = await NetworkClient().postRequest(
        path: ApiEndpoints.login,
        body: {"username": username, "password": password});
    LoginResponseModel? model;
    if (response != null) {
      Map<String, dynamic> json = jsonDecode(response.body);
      model = LoginResponseModel.fromJson(json);
    }

    return model;
  }
}
