import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  TextTheme _textTheme;
  @override
  Widget build(BuildContext context) {
    _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            "Welcome to Order Screen",
            style: _textTheme.headline5,
          ),
        ),
      ),
    );
  }
}
