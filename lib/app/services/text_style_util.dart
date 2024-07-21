import 'package:assignment/app/services/responsive_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleUtil {
  static kALLCAPS({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w600,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return GoogleFonts.inter(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 11.kh,
      decoration: textDecoration,
      letterSpacing: 6,
    );
  }

  static kFootnote({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w600,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return GoogleFonts.inter(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 10.kh,
      decoration: textDecoration,
      letterSpacing: 1,
    );
  }

  static kL({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w600,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return GoogleFonts.inter(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 36.kh,
      decoration: textDecoration,
      letterSpacing: -5,
    );
  }

  static kM({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w600,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return GoogleFonts.inter(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 28.kh,
      decoration: textDecoration,
      letterSpacing: -3,
    );
  }

  static k24({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w600,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return GoogleFonts.inter(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 24.kh,
      decoration: textDecoration,
      letterSpacing: -2,
    );
  }

  static k28({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w600,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return GoogleFonts.inter(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 28.kh,
      decoration: textDecoration,
      letterSpacing: -2,
    );
  }

  static k36({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w600,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return GoogleFonts.inter(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 36.kh,
      decoration: textDecoration,
      letterSpacing: -2,
    );
  }

  static k18({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return GoogleFonts.inter(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 18.kh,
      decoration: textDecoration,
      letterSpacing: -2,
    );
  }

  static k16({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return GoogleFonts.inter(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 16.kh,
      decoration: textDecoration,
      letterSpacing: -1,
    );
  }

  static k10({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return GoogleFonts.inter(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 10.kh,
      decoration: textDecoration,
      letterSpacing: -1,
    );
  }

  static k12({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return GoogleFonts.inter(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 12.kh,
      decoration: textDecoration,
      letterSpacing: -1,
    );
  }

  static k14({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return GoogleFonts.inter(
      fontWeight: fontWeight,
      color: color,
      fontStyle: FontStyle.normal,
      fontSize: 14.kh,
      decoration: textDecoration,
      letterSpacing: -1,
    );
  }
}
