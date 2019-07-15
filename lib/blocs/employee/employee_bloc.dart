import 'package:bloc/bloc.dart';
import './employee_event.dart';
import './employee_state.dart';
import 'package:bloc_pattern_demo/models/models.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  @override
  EmployeeState get initialState => EmployeeLoaded([
        Employee(1, 'One', 0.0),
        Employee(2, 'Two', 0.0),
        Employee(3, 'Three', 0.0),
        Employee(4, 'Four', 0.0),
        Employee(5, 'Five', 0.0),
      ]);

  @override
  Stream<EmployeeState> mapEventToState(EmployeeEvent event) async* {
    yield* this.updateList(event);
  }

  Stream<EmployeeState> updateList(EmployeeEvent event) async* {
    List<Employee> employeeUpdate = (currentState as EmployeeLoaded)
        .employee
        .map((employee) => employee.copyWith(employee))
        .toList();
    final currentSalery = employeeUpdate[event.index].salery;

    employeeUpdate[event.index].salery = (event is IncrementEvent)
        ? (currentSalery + 2000.0)
        : (currentSalery - 2000.0);

    yield EmployeeLoaded(employeeUpdate);
  }
}
