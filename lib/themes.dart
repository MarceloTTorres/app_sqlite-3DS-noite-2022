import 'package:flutter/material.dart';

var lightThemeData = ThemeData(
  primaryColor: Colors.lightBlueAccent[700],
  textTheme:  TextTheme(
    bodyText1: const TextStyle(color: Colors.black),
    button: const TextStyle(color: Colors.black),
    titleMedium: const TextStyle(color: Colors.black, fontSize: 20.0),
  ),
  brightness: Brightness.light,
);

var darkThemeData =  ThemeData(
  primaryColor: Colors.lightBlueAccent[700],
  textTheme:  TextTheme(
    bodyText1: const TextStyle(color: Colors.white),
    button: const TextStyle(color: Colors.white),
    titleMedium: const TextStyle(color: Colors.white, fontSize: 20.0),
  ),
  brightness: Brightness.dark,
);
