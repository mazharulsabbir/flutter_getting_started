import 'package:flutter/material.dart';

ThemeData theme() => ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.grey[100],
      backgroundColor: Colors.white,
      textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.black),
      ),
    );

ThemeData darkTheme() => ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.amber,
      scaffoldBackgroundColor: const Color(0xFF121212),
      backgroundColor: Colors.black,
      textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.white),
      ),
    );
