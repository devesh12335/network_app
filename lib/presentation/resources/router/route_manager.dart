


import 'package:flutter/material.dart';
import 'package:network_app/presentation/home/view.dart';


class Routes {
  static const String homePage = "/homePage";

}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) =>  HomePage());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Container(child: Center(child: Text("Page Not Found"),),)
    );
  }
}
