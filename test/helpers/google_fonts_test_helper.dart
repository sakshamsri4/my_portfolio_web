import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Mock implementation of Google Fonts for testing
TextStyle mockMontserrat({
  TextStyle? textStyle,
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
    fontFamily: 'Montserrat',
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize,
    letterSpacing: letterSpacing,
    height: height,
  );
}

/// Setup Google Fonts for testing
void setupGoogleFontsMock() {
  GoogleFonts.config.allowRuntimeFetching = false;
}
