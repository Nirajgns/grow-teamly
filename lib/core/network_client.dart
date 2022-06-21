import 'package:http/http.dart' as http;
import 'package:profileapp/constants/api_endpoint.dart';
import 'package:profileapp/core/header.dart';

class NetworkClient {
  //to centeralize get request
  Future<http.Response?> getRequest(
      {String baseUrl = ApiEndpoints.baseUrl, required String path}) async {
    http.Response? Response;
    try {
      Response =
          await http.get(Uri.parse(baseUrl + path), headers: getHeader());
    } catch (e) {
      print(e.toString());
    }
    return Response;
  }

  //to centeralize post request
   Future<http.Response?>  postRequest(
      {String baseUrl = ApiEndpoints.baseUrl, required String path,Map<String,dynamic>? body,}) async {
    http.Response? response;
    try {
      response =
          await http.post(Uri.parse(baseUrl + path), headers: getHeader(),body: body);
          
    } catch (e) {
      print(e.toString());
    }
    return response;
  }
}