import 'package:equatable/equatable.dart';
import 'package:quiver/core.dart';

class Employee extends Equatable {
  int id;
  String name;
  double salery;

  Employee(this.id, this.name, this.salery) : super([id, name, salery]);

  Employee copyWith({
    String name,
    double salery,
  }) {
    return Employee(this.id, name ?? this.name, salery ?? this.salery);
  }

  @override
  String toString() {
    return 'Employee { id: $id, name: $name, salery: $salery }';
  }
}
