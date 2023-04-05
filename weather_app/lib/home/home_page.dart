import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/models/weather_models.dart';
import 'package:weather_app/services/fetch_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WeatherCubit(weatherService)..getWeatherCityName('bishkek'),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return const Text('WeatherInitial');
            } else if (state is WeatherLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherSuccess) {
              return WeatherSuccessWidget(state.weatherResponce);
            } else if (state is WeatherError) {
              return const Text('WeatherError');
            } else {
              return const Text('i do not know');
            }
          },
        ),
      ),
    );
  }
}

class WeatherSuccessWidget extends StatelessWidget {
  const WeatherSuccessWidget(
    this.weatherResponce, {
    super.key,
  });

  final WeatherResponce weatherResponce;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(weatherResponce.name),
        Text(weatherResponce.weather[0].id.toString()),
        Text(weatherResponce.weather[0].main.toString()),
        Text(weatherResponce.weather[0].description.toString()),
        Text(weatherResponce.weather[0].icon.toString()),
        Text(weatherResponce.main.temp.toString()),
        Text(weatherResponce.main.feelsLike.toString()),
        Text(weatherResponce.main.tempMax.toString()),
        Text(weatherResponce.main.tempMin.toString()),
        const Text('Mamarasulov Erjigit'),
      ],
    );
  }
}
