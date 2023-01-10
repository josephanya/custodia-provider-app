import 'package:flutter/material.dart';
import 'package:custodia_provider/theme/swatch.dart';

const Color white = Color(0XFFFFFFFF);
const Color offWhite = Color(0XFFF0F3F4);

const Color blue = Color(0xFF4F9EEA);
const Color green = Color(0xFF1CC4B8);
const Color red = Color(0xFFF24640);
const Color pink = Color(0xFFF03874);
const Color yellow = Color(0xFFFFA600);
const Color purple = Color(0xFF5569D7);
const Color grey = Color(0xFF8A9CA8);
const Color orange = Color(0xFFFD916F);
const Color navyBlue = Color(0xff003459);

const Color lightBlue = Color(0xFFF0F6FF);
const Color lightGreen = Color(0xFFE4FBF9);
const Color lightRed = Color(0xFFFEE1EB);
const Color lightYellow = Color(0xFFFFF4E0);
const Color lightPurple = Color(0xFFEAEAFB);
const Color lightGrey = Color(0xFFC4CED4);

const Color disabled = Color(0xFFA4CDF4);
const Color hilighted = Color(0xFFCFEBFC);

const Color black = Color(0xFF000000);
const Color darkGrey = Color(0xFF2B353B);

themeData(context) => ThemeData(
      fontFamily: 'Circular Std',
      primaryColor: blue,
      backgroundColor: white,
      scaffoldBackgroundColor: white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme:
          ColorScheme.fromSwatch(primarySwatch: createMaterialColor(white))
              .copyWith(secondary: blue),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: hilighted,
        cursorColor: blue,
        selectionHandleColor: blue,
      ),
    );
