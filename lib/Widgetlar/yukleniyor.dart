import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hava_durumu/Sabitler/renkler.dart';

Widget Yukleniyor({
  required String metin
}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [

      CircularProgressIndicator(color: renk16,),
      SizedBox(height: 16,),

      Text(
        metin,
        style: GoogleFonts.merriweatherSans(
          fontSize: 24.0,
          color: renk16,
        ),
      ),

    ],);
}