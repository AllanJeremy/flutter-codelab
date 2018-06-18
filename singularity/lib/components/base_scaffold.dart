import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget
{
  final Widget leading;
  final Widget body;
  final String appbarTitle;
  final List<Widget> appBarActions;

  //Constructor
  CustomScaffold({this.leading,this.appbarTitle,this.appBarActions,this.body,});

  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          this.appbarTitle,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,//TODO : Change to theme text color
          )        
        ),
        backgroundColor: Colors.purple[700],//TODO : Change to theme color
        actions: this.appBarActions,
      ),
      body: this.body,
    );
  }
}