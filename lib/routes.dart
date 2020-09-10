import 'package:dogbin_mobile/views/documents_view.dart';
import 'package:dogbin_mobile/views/home_view.dart';
import 'package:dogbin_mobile/views/login_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static String initialRoute = HomeView.id;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var routes = {
      LoginView.id: MaterialPageRoute(
        builder: (_) => LoginView(),
      ),
      DocumentsView.id: MaterialPageRoute(
        builder: (_) => DocumentsView(),
        settings: settings,
      ),
      HomeView.id: MaterialPageRoute(
        builder: (_) => HomeView(),
      ),
    };

    //by default
    if (!routes.containsKey(settings.name)) {
      return routes[HomeView.id];
    }

    return routes[settings.name];
  }
}
