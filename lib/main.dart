import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinjollist/bloc/bloc.dart';
import 'package:pinjollist/ui/companies_screen.dart';

void main() {
  runApp(BlocProvider<CompanyBloc>(
    create: (context) => CompanyBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinjollist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent,
      ),
      home: CompaniesScreen(),
    );
  }
}
