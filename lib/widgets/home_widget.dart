import 'package:bloc_pattern_demo/blocs/employee_bloc.dart';
import 'package:bloc_pattern_demo/models/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  EmployeeBloc employeeBloc;

  @override
  void initState() {
    super.initState();
    employeeBloc = EmployeeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Employee'),
        ),
        body: BlocBuilder<EmployeeEvent, EmployeeState>(
          bloc: employeeBloc,
          builder: (context, snapshot) {
            return this.buildEmployeeListView(snapshot, employeeBloc);
          },
        ));
  }

  ListView buildEmployeeListView(
      EmployeeState snapshot, EmployeeBloc employeeBloc) {
    return ListView.builder(
      itemCount: (snapshot as EmployeeLoaded).employees.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  '${(snapshot as EmployeeLoaded).employees[index].id}',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${(snapshot as EmployeeLoaded).employees[index].name}',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      '₹ ${(snapshot as EmployeeLoaded).employees[index].salery}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.thumb_up),
                  color: Colors.green,
                  onPressed: () {
                    employeeBloc.dispatch(IncrementEvent(index));
                  },
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.thumb_down),
                  color: Colors.red,
                  onPressed: () {
                    employeeBloc.dispatch(DecrementEvent(index));
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void showSnackbar({BuildContext context, String message}) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
