import 'package:bloc_stream_counter/bloc/weather/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBlocPage extends StatelessWidget {
  const WeatherBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(),
      child: _WeatherBlocPageWidget(),
    );
  }
}

class _WeatherBlocPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather Bloc demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                return Text(
                  state.weather,
                  style: Theme.of(context).textTheme.headline2,
                );
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: buttonStyle,
                  child: const Text("Hà Nội"),
                  onPressed: () => context.read<WeatherBloc>().add(HaNoiWeatherEvent()),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  style: buttonStyle,
                  child: const Text("Đà Nẵng"),
                  onPressed: () => context.read<WeatherBloc>().add(DaNangWeatherEvent()),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  style: buttonStyle,
                  child: const Text("Sai Gon"),
                  onPressed: () => context.read<WeatherBloc>().add(SaiGonWeatherEvent()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.blue,
  fixedSize: const Size.fromWidth(100),
  padding: const EdgeInsets.all(10),
);
