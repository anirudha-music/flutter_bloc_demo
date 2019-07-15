import 'package:bloc_pattern_demo/models/employee.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class EmployeeState extends Equatable {
  EmployeeState([props = const []]) : super(props);
}

class EmployeeLoaded extends EmployeeState {
  final List<Employee> employee;

  EmployeeLoaded(this.employee) : super([employee]);

  @override
  String toString() => 'EmployeeLoaded { employee: $employee }';
}
