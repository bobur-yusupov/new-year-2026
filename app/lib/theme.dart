import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFec13ec); //#ec13ec
const Color backgroundLight = Color(0xFFf8f6f8); // #f8f6f8
const Color backgroundDark = Color(0xFF221022); // #221022

final ThemeData theme = ThemeData(
  primaryColor: primaryColor,
  primaryColorDark: backgroundDark,
  scaffoldBackgroundColor: backgroundLight,
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 21
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w900,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: primaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(primaryColor),
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 16, horizontal: 64)),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      )), 
      textStyle: WidgetStatePropertyAll(TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      )),
    ),
  ),
);
