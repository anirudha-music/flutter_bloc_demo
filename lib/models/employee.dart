import 'package:equatable/equatable.dart';

class Employee {
  int id;
  String name;
  double salery;
  Employee(this.id, this.name, this.salery);
}

abstract class EmployeeState extends Equatable {
  EmployeeState([List props = const []]) : super(props);

  @override
  String toString() => '$runtimeType{}';
}

class EmployeeLoaded extends EmployeeState {
  EmployeeLoaded(this.employees) : super([employees]);

  final List<Employee> employees;
}
