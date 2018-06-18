import 'package:flutter/material.dart';

// Screen displayed when matches have been found
class MatchesFound extends StatefulWidget {
  @override
  createState() => new _MatchesFoundState();
}

// State for when matches are found
class _MatchesFoundState extends State<MatchesFound> {
  @override
  Widget build(BuildContext context) {
      return Container(
          child: Center(
              child: Text('Matches were found')
          ),
      );
  }
}