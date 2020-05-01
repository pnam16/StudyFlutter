import 'package:easy_weather/bloc/weatherBloc.dart';
import 'package:easy_weather/model/weatherModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'EasyWeather',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 28.0,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherIsLoading)
              return Center(
                  child:
                      CircularProgressIndicator(backgroundColor: Colors.black));
            else if (state is WeatherIsLoaded)
              return ShowWeather(state.getWeather);
            else
              return Text("Error", style: TextStyle(color: Colors.white));
          },
        ),
      ),
    );
  }
}

class ShowWeather extends StatelessWidget {
  WeatherModel weather;

  ShowWeather(this.weather);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: null);
  }
}
