import 'dart:async';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc {
  var state = CounterState(0);

  final eventController = StreamController<CounterEvent>();
  final stateController = StreamController<CounterState>();

  CounterBloc() {
    eventController.stream.listen((CounterEvent event) {
      if (event is IncrementEvent) {
        state = CounterState(state.counter + 1);
      } else {
        state = CounterState(state.counter - 1);
      }
      stateController.sink.add(state);
    });
  }

  void dispose() {
    stateController.close();
    eventController.close();
  }
}
