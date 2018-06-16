import 'package:flutter/material.dart';
import 'dart:math';
import 'package:english_words/english_words.dart';

void main() => runApp(new ColorChangerApp(appTitle: 'Frostnight'));

class ColorChangerApp extends StatefulWidget {
  
  static final Color bottomNavIconColor = Colors.black54;
  static final double bottomNavIconSize = 96.0;

  final TextStyle light16GreyText = TextStyle(
    fontSize: 16.0,
    color: Colors.blueGrey,
    fontWeight: FontWeight.w300
  );

  final TextStyle bottomNavTextStyle = TextStyle(
    fontSize: 14.0,
    color: bottomNavIconColor,
    fontWeight: FontWeight.w300
  );

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
  WordPair randomWords;

  //Returns a random color from the list we have provided
  Color _getRandomColor() {
    Random rand = new Random();
    int colorIndex = rand.nextInt(widget._appBarColors.length);

    Color colorSelected = widget._appBarColors[colorIndex];
    return colorSelected;
  }

  //Sets the new state/color of the appbars and stuff
  void _updateColorAndWords() {
    // Keep track of last color to ensure we always change the color
    Color lastAppBarColor = appBarColor;

    setState(() {
      randomWords = WordPair.random();
      this.appBarColor = this._getRandomColor();

      //If the new appbar color is the same as the last one, then try changing it again
      if (appBarColor == lastAppBarColor) {
        this._updateColorAndWords();
      }
    });
  }

  //Initial state
  @override
  initState() {
    super.initState();
    this._updateColorAndWords();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Startup name generator',
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
        
        floatingActionButton: FloatingActionButton(
          backgroundColor: this.appBarColor,
          child: Icon(Icons.edit),
          tooltip: 'Change the background color of the button & appbar',
          onPressed: _updateColorAndWords,
        ),

        body: Container(
          padding: EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Some random words that will change every single time you click the button',
                  style: widget.light16GreyText
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical:16.0),
                  child: Text(
                    randomWords.asPascalCase,
                  ),
                ),

              ]
            ),
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          iconSize: ColorChangerApp.bottomNavIconSize,
        
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text(
                'Cloud',
                style: widget.bottomNavTextStyle,
              ),
              icon: Icon(
                Icons.cloud,
                color:ColorChangerApp.bottomNavIconColor,
                
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                'Maps',
                style: widget.bottomNavTextStyle,
              ),
              icon: Icon(
                Icons.map,
                color:ColorChangerApp.bottomNavIconColor,
                
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.redAccent,
              title: Text(
                'Chat',
                style: widget.bottomNavTextStyle,
              ),
              icon: Icon(
                Icons.message,
                color:ColorChangerApp.bottomNavIconColor,
                
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                'Privacy',
                style: widget.bottomNavTextStyle,
              ),
              icon: Icon(
                Icons.lock,
                color:ColorChangerApp.bottomNavIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
