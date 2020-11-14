import 'package:flutter/material.dart';

const brightness = Brightness.light;
// const brightness = Brightness.dark;
const primaryColor = const Color(0xFF0a67a9); //azul
const accentColor = const Color(0xFF00a859); //verde
const backgroundColor = const Color(0xFFdcf2ff); //azul claro
const textColor = const Color(0xFF373435); //cinza

ThemeData androidTheme() {
  return ThemeData(
    brightness: brightness,
    textTheme: new TextTheme(
      bodyText1: new TextStyle(
        fontFamily: "Poppins",
        // color: Colors.red,
      ),
      bodyText2: TextStyle(
        fontFamily: "Poppins",
      ),
      headline1: TextStyle(
        fontFamily: "Poppins",
      ),
      headline2: TextStyle(
        fontFamily: "Poppins",
      ),
      button: TextStyle(
        fontFamily: "Poppins",
      ),
      caption: TextStyle(
        fontFamily: "Poppins",
      ),
      subtitle1: TextStyle(
        fontFamily: "Poppins",
      ),
      subtitle2: TextStyle(
        fontFamily: "Poppins",
      ),
    ),
    primaryColor: primaryColor,
    accentColor: accentColor,
    backgroundColor: backgroundColor,
    buttonColor: textColor,
  );
}
