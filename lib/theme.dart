import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<Color> mainGradient = [
  mainColor,
  secondColor,
  thirdColor,
];

const mockupHeight = 812;
const mockupWidth = 375;

Color mainColor = const Color(0xFF0F2027);
Color secondColor = const Color(0xFF203A43);
Color thirdColor = const Color(0xFF2C5364);

Color greyColor = const Color(0xFFC9CCD5);
Color greenColor = const Color(0xFF54E346);
Color orangeColor = const Color(0xFFFF5403);
Color yellowColor = const Color(0xFFF5E965);
Color whiteColor = const Color(0xFFF5F5F5);

TextStyle whiteTextStyle = GoogleFonts.roboto(
  color: whiteColor,
);
TextStyle greyTextStyle = GoogleFonts.roboto(
  color: greyColor,
);

FontWeight thin = FontWeight.w100;
FontWeight extraLight = FontWeight.w200;
FontWeight light = FontWeight.w300;
FontWeight normal = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight black = FontWeight.w800;
