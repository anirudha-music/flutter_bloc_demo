import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class EmployeeAbstract extends Equatable {
  int id;
  String name;
  double salery;

  EmployeeAbstract(this.id, this.name, this.salery, [List props = const []])
      : super([id, name, salery]..addAll(props));
}

class Employee extends EmployeeAbstract {
  Employee(int id, String name, double salery) : super(id, name, salery);

  @override
  String toString() => '';
}
