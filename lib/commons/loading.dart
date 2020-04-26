import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final String msg;

  Loading({this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        SizedBox(
          height: 20,
        ),
        Text(msg)
      ],
    ));
  }
}
