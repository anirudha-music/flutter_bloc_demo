import 'package:equatable/equatable.dart';
import 'package:quiver/core.dart';

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

  @override
  bool operator ==(Object other) =>
      other is Employee &&
      this.id == other.id &&
      this.name == other.name &&
      this.salery == other.salery;

  @override
  int get hashCode => hash3(id, name, salery);
}
