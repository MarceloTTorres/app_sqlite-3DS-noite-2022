import 'package:flutter/material.dart';

var lightThemeData = new ThemeData(
  primaryColor: Colors.lightBlueAccent[700],
  textTheme: new TextTheme(
    bodyText1: new TextStyle(color: Colors.black),
    button: new TextStyle(color: Colors.black),
    titleMedium: new TextStyle(color: Colors.black, fontSize: 20.0),
  ),
  brightness: Brightness.light,
);

var darkThemeData = new ThemeData(
  primaryColor: Colors.lightBlueAccent[700],
  textTheme: new TextTheme(
    bodyText1: new TextStyle(color: Colors.white),
    button: new TextStyle(color: Colors.white),
    titleMedium: new TextStyle(color: Colors.white, fontSize: 20.0),
  ),
  brightness: Brightness.dark,
);
