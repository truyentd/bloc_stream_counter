import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherState("☀")) {
    on<WeatherEvent>(
      (event, emit) {
        if (event is HaNoiWeatherEvent) {
          emit.call(WeatherState("☀"));
        } else if (event is DaNangWeatherEvent) {
          emit.call(WeatherState("☁"));
        } else if (event is SaiGonWeatherEvent) {
          emit.call(WeatherState("🌧️"));
        }
      },
      transformer: (events, mapper) {
        return events.debounce(const Duration(milliseconds: 500)).switchMap(mapper);
      },
    );
  }
}
