import 'dart:convert';

import 'package:http/http.dart';
import 'package:profileapp/constants/api_endpoints.dart';
import 'package:profileapp/core/network_client.dart';
import 'package:profileapp/features/dashboard/model/dashboard_card.dart';

class DashboardServices {
  //to fetch card data from dashboard
 Future<DashboardCardModel?> fetchDashboardCardData() async {
    final Response?  response  =
       await NetworkClient().getRequest(path: ApiEndpoints.dashboradCardData);
       // if response is not null and there's data present

       DashboardCardModel? dashboardCardModel;
       if (response !=null && response.statusCode == 200){
        Map<String,dynamic> jsonResponse= jsonDecode(response.body);
        dashboardCardModel=DashboardCardModel.fromJson((jsonResponse));

       }
       else{
        dashboardCardModel =null;

       }
       return dashboardCardModel;
  }
}
