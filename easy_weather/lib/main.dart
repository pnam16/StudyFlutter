import 'package:easy_weather/screens/splashScreen.dart';
import 'package:easy_weather/services/WeatherRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/weatherBloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final WeatherRepo weatherRepo = WeatherRepo();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Colors.orangeAccent,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'GoogleSans',
          primaryColor: Colors.black,
          primaryIconTheme: IconThemeData(color: Colors.black),
        ),
//      home: Text('aaa'),
//       home: Provider,
        home: BlocProvider(
            create: (context) => WeatherBloc(weatherRepo),
            child: SplashScreen()));
  }
}
