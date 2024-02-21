import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Sabitler{

  static const anaRenk =Colors.green;
  static const String baslikText = "Dinamik Ortalama Hesaplama";
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
    fontSize: 24,fontWeight: FontWeight.w500,color: anaRenk
  );
static BorderRadius borderRadius = BorderRadius.circular(14);

static final TextStyle dersSayisiStyle = GoogleFonts.quicksand(
  fontSize: 16, fontWeight: FontWeight.w300, color: anaRenk
);
static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
  fontSize: 36, fontWeight: FontWeight.bold, color: anaRenk
);
static final dropDawnPadding = EdgeInsets.symmetric(horizontal: 16,vertical: 8);
static final yatayxy = EdgeInsets.symmetric(horizontal:8,vertical:10);

}