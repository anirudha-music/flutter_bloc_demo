import 'package:equatable/equatable.dart';

class Employee {
  int id;
  String name;
  double salery;

  Employee(this.id, this.name, this.salery);

  static Employee copyWith(Employee employee) {
    return Employee(employee.id, employee.name, employee.salery);
  }

  @override
  String toString() {
    return 'Employee { id: $id, name: $name, salery: $salery }';
  }
}
