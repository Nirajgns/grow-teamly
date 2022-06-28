import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:profileapp/constants/api_endpoints.dart';
import 'package:profileapp/core/network_client.dart';
import 'package:profileapp/features/profile/model/profile_model.dart';

class ProfileServices {
  //to fetch profile
  Future<ProfileModel?> fetchProile() async {
    final http.Response? response = await NetworkClient().getRequest(
      path: ApiEndpoints.profile,
    );
    ProfileModel? profile;
    if (response != null && response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      profile = ProfileModel.fromJson(json);
    }
    return profile;
  }
}
