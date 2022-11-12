import 'package:flutter/material.dart';
class ThemeProvider extends ChangeNotifier{

  ThemeData currentTheme;


  ThemeProvider({
    required bool isDarkMode
  }): currentTheme = isDarkMode ? 
    ThemeData(
      colorScheme: ColorScheme.dark(
        primary: Color.fromARGB(255, 17, 216, 117),
        secondary: Colors.black,
        tertiary: Color.fromARGB(255, 17, 216, 117),
        background: Color.fromARGB(255, 17, 216, 117),
        surface: Colors.black,
        outline: Colors.white,
        onPrimary: Color.fromARGB(255, 17, 216, 117),
        onSecondary: Colors.black,
        onBackground: Color.fromARGB(255, 17, 216, 117),
        onTertiary: Colors.white,
        onSurface: Colors.white,
        inversePrimary: Colors.red,
        inverseSurface: Color.fromARGB(255, 17, 216, 117)
      ),
    ) 
    : 
    ThemeData(
      colorScheme: ColorScheme.light(
        primary: Colors.blue,
        secondary: Color(0xff000A23),
        tertiary: Colors.blue,
        background: Color(0xff000A23),
        surface: Colors.white,
        outline: Colors.black,
        onPrimary: Colors.white,
        onSecondary: Colors.blue,
        onBackground: Colors.blue.shade900,
        onTertiary: Colors.blue,
        onSurface: Colors.white,
        inversePrimary: Colors.red,
        inverseSurface: Color(0xff000A23)
      )
    );

  setLightMode() {
    currentTheme = ThemeData(
      colorScheme: ColorScheme.light(
        primary: Colors.blue,
        secondary: Color(0xff000A23),
        tertiary: Colors.blue,
        background: Color(0xff000A23),
        surface: Colors.white,
        outline: Colors.black,
        onPrimary: Colors.white,
        onSecondary: Colors.blue,
        onBackground: Colors.blue.shade900,
        onTertiary: Colors.blue,
        onSurface: Colors.white,
        inversePrimary: Colors.red,
        inverseSurface: Color(0xff000A23)

      ),
    );
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = ThemeData(
      colorScheme: ColorScheme.dark(
       primary: Color.fromARGB(255, 17, 216, 117),
        secondary: Colors.black,
        tertiary: Color.fromARGB(255, 17, 216, 117),
        background: Color.fromARGB(255, 17, 216, 117),
        surface: Colors.black,
        outline: Colors.white,
        onPrimary: Color.fromARGB(255, 17, 216, 117),
        onSecondary: Colors.black,
        onBackground: Color.fromARGB(255, 17, 216, 117),
        onTertiary: Colors.white,
        onSurface: Colors.white,
        inversePrimary: Colors.red,
        inverseSurface: Color.fromARGB(255, 17, 216, 117)
      ),
    );
    notifyListeners();
  }
}