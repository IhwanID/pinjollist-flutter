import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pinjollist/model/companies.dart';
import 'package:pinjollist/widget/companies_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinjollist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pinjollist by Commonlabs ID"),),
      body: Container(
        child:  CompaniesWidget()
      ),
    );
  }

}

