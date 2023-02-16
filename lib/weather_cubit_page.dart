import 'package:bloc_stream_counter/cubit/weather/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherCubitPage extends StatelessWidget {
  const WeatherCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: _WeatherCubitPageWidget(),
    );
  }
}

class _WeatherCubitPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather cubit demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<WeatherCubit, WeatherState>(
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
                  onPressed: () => context.read<WeatherCubit>().getHaNoiWeather(),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  style: buttonStyle,
                  child: const Text("Đà Nẵng"),
                  onPressed: () => context.read<WeatherCubit>().getDaNangWeather(),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  style: buttonStyle,
                  child: const Text("Sai Gon"),
                  onPressed: () => context.read<WeatherCubit>().getSaiGonWeather(),
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
