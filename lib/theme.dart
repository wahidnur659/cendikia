import'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color backgroundColor1 = Color.fromARGB(255, 221, 215, 225);
Color backgroundColor2 = Color.fromARGB(255, 55, 0, 255);

Color textColor1 = Color(0xff292964);
Color textColor2 = Color(0xff3100E4);
Color textColor3 = Color(0xff000000);
Color textColor4 = Color(0xffFFFFFF);


FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;

TextStyle title1 = GoogleFonts.poppins(
  color: textColor1,
  fontWeight: semiBold,
  fontSize: 50,
);

TextStyle title2 = GoogleFonts.poppins(
  color: textColor2,
  fontWeight: semiBold,
  fontSize: 50,
);
TextStyle blackTextStyle = GoogleFonts.poppins(
  color: textColor3,
);
TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: textColor4,
);

final Color facebookColor = const Color(0xff39579A);
final Color googleColor = const Color(0xffDF4A32);
final Color nohpColor = const Color(0xff202020);