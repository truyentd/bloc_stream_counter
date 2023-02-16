import 'package:bloc_stream_counter/counter_page.dart';
import 'package:bloc_stream_counter/weather_bloc_page.dart';
import 'package:bloc_stream_counter/weather_cubit_page.dart';
import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BLoC demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: buttonStyle,
              child: const Text("BLoC with Stream"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CounterPage()));
              },
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              style: buttonStyle,
              child: const Text("Cubit"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const WeatherCubitPage()));
              },
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              style: buttonStyle,
              child: const Text("Bloc"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const WeatherBlocPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.blue,
  fixedSize: const Size.fromWidth(200),
  padding: const EdgeInsets.all(10),
);
