import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/models/weather_models.dart';
import 'package:weather_app/services/fetch_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());

  final WeatherService weatherService;

  Future<void> getWeatherCityName(String cityName) async {
    emit(WeatherLoading());
    final date = await weatherService.getWeatherByCityName(cityName);
    if (date != null) {
      emit(WeatherSuccess(date));
    } else {
      emit(const WeatherError('kata boldu'));
    }
  }
}
