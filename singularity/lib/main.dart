import 'package:flutter/material.dart';



//TODO: Check if the user has been set up and show appropriate home page 


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('My application')
      )
    );
  }
}