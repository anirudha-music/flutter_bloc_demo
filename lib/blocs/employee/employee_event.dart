import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class EmployeeEvent extends Equatable {
  final int _index;
  EmployeeEvent(this._index, [List props = const []]) : super([props, _index]);

  int get index => this._index;
}

class IncrementEvent extends EmployeeEvent {
  IncrementEvent(int index) : super(index);
}

class DecrementEvent extends EmployeeEvent {
  DecrementEvent(int index) : super(index);
}
