import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc_pattern_demo/models/employee.dart';

@immutable
abstract class EmployeeState extends Equatable {
  EmployeeState([List props = const []]) : super(props);
}

class EmployeeLoaded extends EmployeeState {
  final List<Employee> employee;

  EmployeeLoaded([this.employee = const []]) : super([employee]);

  @override
  String toString() => 'EmployeeLoaded { employee: $employee }';
}
