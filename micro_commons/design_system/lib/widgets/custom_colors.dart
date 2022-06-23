import 'package:flutter/material.dart';

class SPcolors {
  static SPcolors? _instance;

  SPcolors._();

  factory SPcolors() {
    _instance ??= SPcolors._();
    return _instance!;
  }

  // PRIMARY COLOR SCALES
  static const MaterialColor primaryColor = MaterialColor(0xFF356859, <int, Color>{
    // Primária fundo
    50: Color(0xFFFFFBE6),
    // Primary Clara
    100: Color(0xFFb5e3d0),

    200: Color(0xFF7dcfad),
    // Secundária media clara
    300: Color(0xFF45ba89),

    // Primária Media
    400: Color(0xFF37966F),
    // Primária - Comum
    500: Color(0xFF356859),

    // Primária mais escuro
    600: Color(0xFF297052),
    700: Color(0xFF1c4a37),
    800: Color(0xFF153829),
    900: Color(0xFF153829),
    1000: Color(0xFF153829),
  });

  // SECONDARY COLOR SCALES
  static const MaterialColor secondaryColor = MaterialColor(
    0xFF4a6237,
    <int, Color>{
      // Secundária fundo
      50: Color(0xFFffffff),
      // Secundária clara
      100: Color(0xFF89ac6c),
      // Secundária media
      200: Color(0xFF638349),
      // Secundária
      300: Color(0xFF4a6237),
      // Secundária mais escuro
      400: Color(0xFF3e522e),
      500: Color(0xFF324125),
      600: Color(0xFF324125),
      700: Color(0xFF324125),
      800: Color(0xFF324125),
      900: Color(0xFF324125),
      1000: Color(0xFF324125),
    },
  );

  // containerColor COLOR SCALES
  static const MaterialColor containerColor = MaterialColor(
    0xFFebf1e6,
    <int, Color>{
      // containerColor fundo
      50: Color(0xFFffffff),
      // containerColor clara
      100: Color(0xFFE7FF70),
      // containerColor media
      200: Color(0xFFf2f6ef),
      // containerColor
      300: Color(0xFFebf1e6),
      // containerColor mais escuro
      400: Color(0xFFe5edde),
      500: Color(0xFFebf1e6),
      600: Color(0xFFebf1e6),
      700: Color(0xFFebf1e6),
      800: Color(0xFFebf1e6),
      900: Color(0xFFebf1e6),
      1000: Color(0xFFebf1e6),
    },
  );

  // GREY COLOR SCALES
  static MaterialColor greyColor = const MaterialColor(
    0xFF565959,
    <int, Color>{
      // Branco
      50: Color(0xFFFFFFFF),
      // Cinza fundo
      100: Color(0xFFF5F7F7),
      // Cinza desligado
      200: Color(0xFFDEE0E0),
      // Cinza inativo
      300: Color(0xFF9EA3A3),
      // Cinza claro
      400: Color(0xFF7a8080),
      // Cinza
      500: Color(0xFF565959), // *
      // Cinza escuro
      600: Color(0xFF313333),
      // Preto
      700: Color(0xFF181919),
      800: Color(0xFF181919),
      900: Color(0xFF181919),
      1000: Color(0xFF181919),
    },
  );

  // SYSTEMIC COLORS
  static const MaterialColor confirmationGreenColor = MaterialColor(
    0xFF43CC39,
    <int, Color>{
      /// Claro
      50: Color(0xFFF1FFF0),

      /// Escuro
      100: Color(0xFF43CC39),
      200: Color(0xFF43CC39),
      300: Color(0xFF43CC39),
      400: Color(0xFF43CC39),
      500: Color(0xFF43CC39),
      600: Color(0xFF43CC39),
      700: Color(0xFF43CC39),
      800: Color(0xFF43CC39),
      900: Color(0xFF43CC39),
    },
  );

  static const MaterialColor errorRedColor = MaterialColor(
    0xFFE74742,
    <int, Color>{
      /// Claro
      50: Color(0xFFFFF0F0),

      /// Escuro
      100: Color(0xFFE74742),
      200: Color(0xFFE74742),
      300: Color(0xFFE74742),
      400: Color(0xFFE74742),
      500: Color(0xFFE74742),
      600: Color(0xFFE74742),
      700: Color(0xFFE74742),
      800: Color(0xFFE74742),
      900: Color(0xFFE74742),
    },
  );

  static const MaterialColor alertOrangeColor = MaterialColor(
    0xFFFF9900,
    <int, Color>{
      /// Claro
      50: Color(0xFFFFFED6),

      /// Escuro
      100: Color(0xFFFF9900),
      200: Color(0xFFFF9900),
      300: Color(0xFFFF9900),
      400: Color(0xFFFF9900),
      500: Color(0xFFFF9900),
      600: Color(0xFFFF9900),
      700: Color(0xFFFF9900),
      800: Color(0xFFFF9900),
      900: Color(0xFFFF9900),
    },
  );
}
