import 'package:flutter/material.dart';
import 'package:hava_durumu/Sabitler/renkler.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class HavaDurumuIkonu extends StatelessWidget {
  final String durum;
  double size;
  HavaDurumuIkonu({required this.durum, required this.size});

  @override
  Widget build(BuildContext context) {

    IconData icon;

    if(durum.toLowerCase().contains("açık") ||
        durum.toLowerCase().contains("güneş")) {
      icon = Icons.wb_sunny;
    }
    else if(durum.toLowerCase().contains("bulut") ||
        durum.toLowerCase().contains("kapalı")) {
      icon = Icons.cloud_outlined;
    }
    else if(durum.toLowerCase().contains("yağmur") || durum.toLowerCase().contains("yağış")) {
      icon = MdiIcons.weatherPouring;
    }
    else if(durum.toLowerCase().contains("kar")) {
      icon = MdiIcons.weatherSnowy;
    }
    else if(durum.toLowerCase() == "-") {
      icon = MdiIcons.dotsHorizontal;
    }
    else{
      icon = Icons.help_outline;
    }

    return Icon(icon, color: renk16, size: size, );
  }
}
