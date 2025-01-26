part of 'counter_bloc.dart';

abstract class CounterStates {}

class InitialCounterState extends CounterStates {}

class UpdateCounterNumberState extends CounterStates {
  final int updatedNumber;

  UpdateCounterNumberState({required this.updatedNumber});
}
