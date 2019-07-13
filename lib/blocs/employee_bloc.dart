import 'package:bloc/bloc.dart';
import '../models/employee.dart';
import 'package:meta/meta.dart';

@immutable
abstract class EmployeeEvent {
  final int _index;
  EmployeeEvent(this._index);

  int get index => this._index;
}

class IncrementEvent extends EmployeeEvent {
  IncrementEvent(int index) : super(index);
}

class DecrementEvent extends EmployeeEvent {
  DecrementEvent(int index) : super(index);
}

class EmployeeBloc extends Bloc<EmployeeEvent, List<Employee>> {
  @override
  List<Employee> get initialState => [
        Employee(1, 'Employee One', 10000.0),
        Employee(2, 'Employee Two', 10000.0),
        Employee(3, 'Employee Three', 10000.0),
        Employee(4, 'Employee Four', 10000.0),
        Employee(5, 'Employee Five', 10000.0),
      ];

  @override
  Stream<List<Employee>> mapEventToState(EmployeeEvent event) async* {
    if (event is IncrementEvent) {
      yield this.updateList(event);
    } else if (event is DecrementEvent) {
      yield this.updateList(event);
    }
  }

  List<Employee> updateList(EmployeeEvent event) {
    List<Employee> newState =
        currentState.map((employee) => Employee.copyWith(employee)).toList();
    final currentSalery = newState[event.index].salery;

    newState[event.index].salery = (event is IncrementEvent)
        ? (currentSalery + 2000.0)
        : (currentSalery - 2000.0);
    return newState;
  }
}
