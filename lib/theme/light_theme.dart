import 'package:flutter/material.dart';

ThemeData light({Color color = const Color(0xFF2AB3C6)}) => ThemeData(
  fontFamily: 'OpenSans',
  primaryColor: color,
  secondaryHeaderColor: Color(0xFF08293B),
  backgroundColor: Color(0xFF188095),
  brightness: Brightness.light,
  hintColor: Color(0xFFFFE072),
  cardColor: Colors.white,
  canvasColor: Color(0xFF444B51),
  highlightColor: Color(0xFF2A404B),
);

