import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hava_durumu/Sabitler/renkler.dart';
import 'package:weather_icons/weather_icons.dart';

Widget Gosterge({
  required String metin,
  required IconData ikon,
  Color renk = renk16
}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Icon(
        ikon,
        size: 42.0,
        color: renk,
      ),
      Text(
        metin,
        style: GoogleFonts.merriweatherSans(
          fontSize: 22.0,
          color: renk,
        ),
      ),
    ],
  );
}