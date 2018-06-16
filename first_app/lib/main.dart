import 'package:flutter/material.dart';
import 'dart:math';
import 'package:english_words/english_words.dart';

void main() => runApp(new ColorChangerApp(appTitle: 'Frostnight'));

class ColorChangerApp extends StatefulWidget {
  //Colors we can toggle through
  final List<Color> _appBarColors = [
    Colors.red,
    Colors.blue,
    Colors.black,
    Colors.purple,
    Colors.amber
  ];

  final String appTitle;
  ColorChangerApp({this.appTitle});

  @override
  createState() => new _ColorChangerAppState();
}

class _ColorChangerAppState extends State<ColorChangerApp> {
  Color appBarColor;

  //Returns a random color from the list we have provided
  Color _getRandomColor() {
    Random rand = new Random();
    int colorIndex = rand.nextInt(widget._appBarColors.length);

    Color colorSelected = widget._appBarColors[colorIndex];
    return colorSelected;
  }

  //Sets the new state/color of the appbars and stuff
  void _updateColor() {
    // Keep track of last color to ensure we always change the color
    Color lastAppBarColor = appBarColor;

    setState(() {
      appBarColor = this._getRandomColor();

      //If the new appbar color is the same as the last one, then try changing it again
      if (appBarColor == lastAppBarColor) {
        this._updateColor();
      }
    });
  }

  //Initial state
  @override
  initState() {
    super.initState();
    this.appBarColor = this._getRandomColor();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My custom counter',
      home: new Scaffold(
        appBar: AppBar(
            backgroundColor: this.appBarColor,
            title: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:16.0),
                  child: Icon(Icons.ac_unit, color:Colors.white),
                ),
                Text(
                  widget.appTitle,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                )
              ]
            )
        ),
        body: Center(
          child: RaisedButton(
            child: Text(
              'Click me to change color',
              style: TextStyle(fontSize: 18.0),
            ),
            onPressed: _updateColor,
            color: appBarColor,
            textColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
