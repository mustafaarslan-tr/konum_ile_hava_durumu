import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hava_durumu/Sabitler/renkler.dart';

Widget Hata({required String metin}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(Icons.close, color: renk20, size: 40,),
      SizedBox(height: 16,),
      Text(
        metin,
        style: GoogleFonts.merriweatherSans(
          fontSize: 24.0,
          color: renk20,
        ),
      ),
    ],);
}