import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_color_scheme.dart';
import 'custom_theme.dart';

final class CustomLightTheme implements CustomTheme {
  @override
  final ThemeData themeData = ThemeData(
    useMaterial3: true,
    colorScheme: CustomColorScheme.lightColorScheme,
    cardTheme: CardTheme(
      shadowColor: CustomColorScheme.lightColorScheme.primary,
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: CustomColorScheme.lightColorScheme.onPrimary,
      unselectedLabelColor:
          CustomColorScheme.lightColorScheme.onPrimaryContainer,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(padding: EdgeInsets.zero),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: CustomColorScheme.lightColorScheme.onPrimary,
      ),
      displayLarge: TextStyle(
        color: CustomColorScheme.lightColorScheme.onPrimary,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
          color: CustomColorScheme.lightColorScheme.onPrimaryContainer,
          fontSize: 15,
          fontWeight: FontWeight.w800),
      titleMedium: TextStyle(
          color: CustomColorScheme.lightColorScheme.primary,
          fontWeight: FontWeight.w600),
      titleLarge: TextStyle(
          color: CustomColorScheme.lightColorScheme.primary,
          fontWeight: FontWeight.w600),
    ),
    appBarTheme: AppBarTheme(
        color: CustomColorScheme.lightColorScheme.primary,
        titleTextStyle: TextStyle(
          color: CustomColorScheme.lightColorScheme.onPrimary,
        )),
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
}
