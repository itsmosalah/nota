import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

final themesData = [
  AppTheme(
    id: "dark_teal",
    description: "Dark Teal Theme",
    data: ThemeData(
      useMaterial3: true,
      primaryColor: Colors.blueAccent,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color.fromARGB(255, 0, 100, 95),
        onPrimary: Color.fromARGB(255, 200, 255, 250),
        secondary: Color.fromARGB(100, 0, 100, 95),
        onSecondary: Color.fromARGB(255, 200, 255, 250),
        error: Colors.grey,
        onError: Colors.red,
        background: Color.fromARGB(255, 71, 71, 71),
        onBackground: Color.fromARGB(255, 200, 255, 250),
        surface: Colors.black,
        onSurface: Color.fromARGB(255, 235, 255, 253),
      ),
    ),
  ),
  AppTheme(
    id: "light_teal",
    description: "Light Teal Theme",
    data: ThemeData(
      useMaterial3: true,
      primaryColor: Colors.blueAccent,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color.fromARGB(255, 0, 140, 133),
        onPrimary: Color.fromARGB(255, 0, 0, 0),
        secondary: Color.fromARGB(100, 0, 174, 165),
        onSecondary: Color.fromARGB(255, 0, 38, 35),
        error: Colors.red,
        onError: Colors.red,
        background: Color.fromARGB(255, 241, 241, 241),
        onBackground: Color.fromARGB(255, 0, 116, 106),
        surface: Colors.white,
        onSurface: Color.fromARGB(255, 0, 28, 25),
      ),
    ),
  ),
  AppTheme(
    id: "light_purple",
    description: "Light Purple Theme",
    data: ThemeData(
      useMaterial3: true,
      primaryColor: Colors.blueAccent,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color.fromARGB(255, 159, 87, 223),
        onPrimary: Color.fromARGB(255, 0, 0, 0),
        secondary: Color.fromARGB(255, 155, 137, 219),
        onSecondary: Color.fromARGB(255, 200, 255, 250),
        error: Colors.grey,
        onError: Colors.red,
        background: Color.fromARGB(255, 241, 241, 241),
        onBackground: Color.fromARGB(255, 85, 0, 128),
        surface: Colors.white,
        onSurface: Color.fromARGB(255, 25, 0, 38),
      ),
    ),
  ),
  AppTheme(
    id: "dark_purple",
    description: "Dark Purple Theme",
    data: ThemeData(
      useMaterial3: true,
      primaryColor: Colors.blueAccent,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color.fromARGB(255, 126, 103, 208),
        onPrimary: Color.fromARGB(255, 0, 0, 0),
        secondary: Color.fromARGB(255, 58, 51, 82),
        onSecondary: Color.fromARGB(255, 251, 200, 255),
        error: Colors.grey,
        onError: Colors.red,
        background: Color.fromARGB(255, 71, 71, 71),
        onBackground: Color.fromARGB(255, 237, 200, 255),
        surface: Colors.black,
        onSurface: Color.fromARGB(255, 254, 244, 255),
      ),
    ),
  ),
];
