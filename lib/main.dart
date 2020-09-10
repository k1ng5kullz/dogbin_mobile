import 'package:dogbin_mobile/routes.dart';
import 'package:dogbin_mobile/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  locateServices();

  runApp(
    ProviderScope(
      child: DogbinApp(),
    ),
  );
}

Map<int, Color> color = {
  50: Color.fromRGBO(249, 191, 211, .1),
  100: Color.fromRGBO(249, 191, 211, .2),
  200: Color.fromRGBO(249, 191, 211, .3),
  300: Color.fromRGBO(249, 191, 211, .4),
  400: Color.fromRGBO(249, 191, 211, .5),
  500: Color.fromRGBO(249, 191, 211, .6),
  600: Color.fromRGBO(249, 191, 211, .7),
  700: Color.fromRGBO(249, 191, 211, .8),
  800: Color.fromRGBO(249, 191, 211, .9),
  900: Color.fromRGBO(249, 191, 211, 1),
};
MaterialColor customColor = MaterialColor(0xFFF9BFD3, color);

class DogbinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dogbin App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: customColor,
        accentColor: customColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.initialRoute,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
