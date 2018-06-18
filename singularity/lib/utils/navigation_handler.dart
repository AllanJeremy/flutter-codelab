import 'dart:async';

import 'package:flutter/material.dart';

class NavigationHandler
{
  Future<Object> navigateTo(context,route)
  {
    return Navigator.of(context).pushNamed(route);
  }
}