import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherState("☀"));

  getHaNoiWeather() {
    emit(WeatherState("☀"));
  }

  getDaNangWeather() {
    emit(WeatherState("☁"));
  }

  getSaiGonWeather() {
    emit(WeatherState("🌧️"));
  }
}
