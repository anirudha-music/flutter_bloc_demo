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
    double currentSalery = currentState[event.index].salery;
    List<Employee> newState = currentState;

    if (event is IncrementEvent) {
      newState[event.index].salery = currentSalery + (currentSalery * 0.2);
    } else if (event is DecrementEvent) {
      newState[event.index].salery = currentSalery - (currentSalery * 0.2);
    }
    
    yield newState;
  }
}
