import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
part 'counter_states.dart';
part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterStates> {
  CounterBloc() : super(InitialCounterState()) {
    on<ChangeCounterEvent>(_changeCounter);
  }

  Future<void> _changeCounter(
      ChangeCounterEvent event, Emitter<CounterStates> emit) async {
    emit(UpdateCounterNumberState(updatedNumber: event.changedNumber + 1));
  }
}
