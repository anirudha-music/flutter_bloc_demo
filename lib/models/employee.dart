import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  int id;
  String name;
  double salery;

  Employee(this.id, this.name, this.salery) : super([id, name, salery]);

  Employee copyWith(Employee employee) {
    return Employee(employee.id, employee.name, employee.salery);
  }

  @override
  String toString() {
    return 'Employee { id: $id, name: $name, salery: $salery }';
  }
}
