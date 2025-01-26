import 'package:bloc/bloc.dart';
import 'package:different_blocs/constant.dart';
import 'package:flutter/material.dart';
part 'counter_states.dart';

class CounterBloc extends Cubit<CounterStates> {
  CounterBloc() : super(InitialCounterState());

  Future<void> changeCounter(int number,
      {required PickedOperation pickedOperation}) async {
    switch (pickedOperation) {
      case PickedOperation.add:
        emit(UpdateCounterNumberState(updatedNumber: ++number));

      case PickedOperation.subtract:
        emit(UpdateCounterNumberState(updatedNumber: --number));
    }
  }
}
