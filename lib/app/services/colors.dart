import 'package:flutter/material.dart';
import 'hexColorToFlutterColor.dart';

extension ColorUtil on BuildContext {
  Color dynamicColor({required int light, required int dark}) {
    return (Theme.of(this).brightness == Brightness.light) ? Color(light) : Color(dark);
  }

  Color dynamicColour({required Color light, required Color dark}) {
    return (Theme.of(this).brightness == Brightness.light) ? light : dark;
  }

  Color get brandColor1 => dynamicColour(light: HexColor("#1f74e3"), dark: HexColor("#1f74e3"));

  Color get brandColor2 => dynamicColour(light: HexColor("#1458b8"), dark: HexColor("#1458b8"));

  Color get kWhite => dynamicColour(light: HexColor("#ffffff"), dark: HexColor("#ffffff"));

  Color get kWhite1 => dynamicColour(light: HexColor("#eeeef7"), dark: HexColor("#eeeef7"));

  Color get kWhite2 => dynamicColour(light: HexColor("#d7d7ea"), dark: HexColor("#d7d7ea"));

  Color get kWhite3 => dynamicColour(light: HexColor("#7f7f99"), dark: HexColor("#7f7f99"));

  Color get kWhite4 => dynamicColour(light: HexColor("#4e4e64"), dark: HexColor("#4e4e64"));

  Color get kBlack => dynamicColour(light: HexColor("#121217"), dark: HexColor("#121217"));

  Color get kGreenLight1 => dynamicColour(light: HexColor("#e7f9f1"), dark: HexColor("#e7f9f1"));

  Color get kGreenLight => dynamicColour(light: HexColor("#b1ecd2"), dark: HexColor("#b1ecd2"));

  Color get kGreen => dynamicColour(light: HexColor("#13ae6b"), dark: HexColor("#13ae6b"));

  Color get kGreenDark => dynamicColour(light: HexColor("#0d7347"), dark: HexColor("#0d7347"));

  Color get kRedLight1 => dynamicColour(light: HexColor("#ffebef"), dark: HexColor("#ffebef"));

  Color get kRedLight2 => dynamicColour(light: HexColor("#fecdd7"), dark: HexColor("#fecdd7"));

  Color get kRed => dynamicColour(light: HexColor("#f01944"), dark: HexColor("#f01944"));

  Color get kRedDark => dynamicColour(light: HexColor("#ae0427"), dark: HexColor("#ae0427"));

  Color get kYellowLight1 => dynamicColour(light: HexColor("#fef8e7"), dark: HexColor("#fef8e7"));

  Color get kYellowLight2 => dynamicColour(light: HexColor("#fbeab6"), dark: HexColor("#fbeab6"));

  Color get kYellow => dynamicColour(light: HexColor("#f5b800"), dark: HexColor("#f5b800"));

  Color get kYellowDark => dynamicColour(light: HexColor("#a87e00"), dark: HexColor("#a87e00"));


  Color get kOrangeLight => dynamicColour(light: HexColor("#FCEEE8"), dark: HexColor("#FCEEE8"));

  Color get kOrange => dynamicColour(light: HexColor("#F7CDBA"), dark: HexColor("#F7CDBA"));

  Color get kOrangeDark => dynamicColour(light: HexColor("#E5581A"), dark: HexColor("#E5581A"));
  Color get kSkyBlue => dynamicColour(light: HexColor("#EAF3FE"), dark: HexColor("#EAF3FE"));
  Color get kGray => dynamicColour(light: HexColor("#F5F5FA"), dark: HexColor("#F5F5FA"));
  Color get kVideoLight => dynamicColour(light: HexColor("#D4F1F7"), dark: HexColor("#D4F1F7"));
  Color get kClinicLight => dynamicColour(light: HexColor("#F1E9FB"), dark: HexColor("#F1E9FB"));
  Color get kVideo => dynamicColour(light: HexColor("#067489"), dark: HexColor("#067489"));
  Color get kClinic => dynamicColour(light: HexColor("#7B33CC"), dark: HexColor("#7B33CC"));


}
