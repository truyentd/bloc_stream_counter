import 'package:bloc_stream_counter/bloc/counter/counter_bloc.dart';
import 'package:flutter/material.dart';

import 'bloc/counter/counter_event.dart';
import 'bloc/counter/counter_state.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Counter Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            StreamBuilder<CounterState>(
              stream: _counterBloc.stateController.stream,
              initialData: _counterBloc.state,
              builder: (BuildContext context, AsyncSnapshot<CounterState> snapshot) {
                return Text(
                  '${snapshot.data?.counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: "Btn1",
                  onPressed: () => _counterBloc.eventController.sink.add(DecrementEvent()),
                  child: const Icon(Icons.exposure_minus_1),
                ),
                const SizedBox(width: 16),
                FloatingActionButton(
                  heroTag: "Btn2",
                  onPressed: () => _counterBloc.eventController.sink.add(IncrementEvent()),
                  child: const Icon(Icons.plus_one),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}
