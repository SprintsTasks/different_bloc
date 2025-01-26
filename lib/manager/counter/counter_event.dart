part of "counter_bloc.dart";

@immutable
abstract class CounterEvent {}

class ChangeCounterEvent extends CounterEvent {
  final int changedNumber;
  ChangeCounterEvent({required this.changedNumber});
}
