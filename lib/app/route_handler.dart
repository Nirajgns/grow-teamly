import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profileapp/app/routes.dart';
import 'package:profileapp/constants/pages/dummy_pages.dart';
import 'package:profileapp/features/daily_updates/views/add_daily_updates_view.dart';
import 'package:profileapp/features/profile/model/dummy_page_model.dart';
import 'package:profileapp/home_page.dart';
import 'package:profileapp/login_page.dart';
import 'package:flutter/material.dart';

class RouteHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var arguments = settings.arguments;

    switch (settings.name) {
      case AppRoutes.loginRoute:
        return MaterialPageRoute(
          builder: ((context) => const Loginpage()),
        );

      case AppRoutes.homeRoute:
        return MaterialPageRoute(
          builder: ((context) => const Homepage()),
        );

      case AppRoutes.addDailyUpdateRoute:
        return MaterialPageRoute(
          builder: ((context) => const AddDailyUpdateView()),
        );

      case AppRoutes.dummyRoute:
        return MaterialPageRoute(
          builder: ((context) => DummyPage(
                data: arguments as DummyPageModel,
              )),
        );

      default:
        return MaterialPageRoute(
          builder: ((context) => const Loginpage()),
        );
    }
  }
}
