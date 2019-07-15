import 'package:bloc_pattern_demo/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './blocs/blocs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        builder: (BuildContext context) => EmployeeBloc(),
        child:
            MaterialApp(debugShowCheckedModeBanner: false, home: HomeWidget()));
  }
}
