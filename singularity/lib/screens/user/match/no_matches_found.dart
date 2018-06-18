import 'package:flutter/material.dart';

// Screen displayed when no matches have been found
class NoMatchesFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text('No matches found'),
    ));
  }
}