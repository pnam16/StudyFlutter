import 'package:easy_weather/screens/splashScreen.dart';
import 'package:easy_weather/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
//   = WeatherRepo();

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultBrightness: Brightness.light,
      builder: (context, _brightness) {
        return MaterialApp(
          title: 'Flutter Weather App',
          theme: ThemeData(
            primaryColor: Colors.black,
            brightness: _brightness,
            fontFamily: 'GoogleSans',
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}
