import 'dart:developer';
import 'dart:js';

import 'package:http/http.dart' as http;
import 'package:profileapp/constants/api_endpoints.dart';
import 'package:profileapp/core/header.dart';
import 'package:profileapp/helpers/snacks.dart';
import 'package:profileapp/locator.dart';
import 'package:profileapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetworkClient {
  //to centeralize get request
  Future<http.Response?> getRequest(
      {String baseUrl = ApiEndpoints.baseUrl, required String path}) async {
    http.Response? response;
    try {
      response = await http.get(
        Uri.parse(baseUrl + path),
        headers: getHeader(),
      );  
      if (response.statusCode == 200) {
        locator.get<SharedPreferences>().setString(path, response.body);
      }
    } catch (e) {
      final _cacheValue = locator<SharedPreferences>().getString(path);
      if (_cacheValue != null) {
        response = http.Response(_cacheValue, 200);
      }
      AppSnacks.showSnacksBar(AppSettings.navigatorKey.currentContext!,
          message: "Something went wrong");

      print(
        e.toString(),
      );
    }
    log(response != null ? response.statusCode.toString() : "response is null");
    return response;
  }

  //to centeralize post request
  Future<http.Response?> postRequest({
    String baseUrl = ApiEndpoints.baseUrl,
    required String path,
    Map<String, dynamic>? body,
  }) async {
    http.Response? response;
    try {
      response = await http.post(Uri.parse(baseUrl + path),
          headers: getHeader(), body: body);
    } catch (e) {
      print(e.toString());
    }
    log(response != null ? response.statusCode.toString() : "response is null");

    return response;
  }
}
