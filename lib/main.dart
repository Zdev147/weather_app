import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/core/utils/location_util.dart';
import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    LocationUtil.init(),
  ]).then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'task',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.weatherScreen,
      routes: AppRoutes.routes,
    );
  }
}
