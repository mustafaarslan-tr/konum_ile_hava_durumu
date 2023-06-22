import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void SinekBar({required BuildContext context,required Color arkaplan_rengi,required Color yazi_rengi, required String baslik_metni, required int duration}) {
  Future.delayed(Duration.zero, () {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.fromLTRB(20,0,20,80),
      backgroundColor: arkaplan_rengi,
      content: Text(
        '$baslik_metni',
        textAlign: TextAlign.center,
        style: GoogleFonts.merriweatherSans(
            color: yazi_rengi,
            letterSpacing: 1,
            fontSize: 15,
            fontWeight: FontWeight.bold),
      ),
      duration:  Duration(milliseconds: duration),
    ));
  });
}