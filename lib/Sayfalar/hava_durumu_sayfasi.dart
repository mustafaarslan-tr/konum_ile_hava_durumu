import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hava_durumu/Modeller/hava.dart';
import 'package:hava_durumu/Sabitler/snack_bar.dart';
import 'package:hava_durumu/Widgetlar/gosterge.dart';
import 'package:hava_durumu/Sabitler/hava_durumu_ikonlari.dart';
import 'package:hava_durumu/Sabitler/renkler.dart';
import 'package:hava_durumu/Widgetlar/hata.dart';
import 'package:hava_durumu/Widgetlar/hava_durumu.dart';
import 'package:hava_durumu/Widgetlar/yukleniyor.dart';
import 'package:http/http.dart' as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weather_icons/weather_icons.dart';

class HavaDurumuSayfasi extends StatefulWidget {
  const HavaDurumuSayfasi({super.key});

  @override
  State<HavaDurumuSayfasi> createState() => _HavaDurumuSayfasiState();
}

class _HavaDurumuSayfasiState extends State<HavaDurumuSayfasi> {
  HavaDurumu? havaDurumu;
  String mevcut_konum = '';

  Widget konum_hatasi_widget = Yukleniyor(metin: "Konum Aranıyor");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        konumGetir();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    mevcut_konum == "" ? konumGetir() : null;

    return Scaffold(
        backgroundColor: beyaz,
        appBar: AppBar(
          backgroundColor: renk18,
          centerTitle: true,
          title: Text(
            "Hava Durumu",
            style: GoogleFonts.merriweatherSans(
              fontSize: 24.0,
              color: beyaz,
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              mevcut_konum.isNotEmpty
                  ? HavaDurumuBilgileri(
                      havaDurumu: _havaDurumuBilgisi(ilce: mevcut_konum))
                  : konum_hatasi_widget,
            ],
          ),
        ));
  }

  Future<HavaDurumu> _havaDurumuBilgisi({required String ilce}) async {
    final url = 'https://wttr.in/${ilce}?format=%C\n%t\n%T\n%w\n%f\n%h&lang=tr';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = response.body;
      final lines = data.trim().split('\n');

      return HavaDurumu(
        yer: ilce,
        hava_durumu: lines[0],
        sicaklik: lines[1],
        ruzgar: lines[3],
        hissedilen_sicaklik: lines[4],
        nem_durumu: lines[5],
      );
    } else {
      throw Exception('Hava durumu yüklenirken hata oluştu!');
    }
  }

  void konumGetir() async {
    LocationPermission permission = await Geolocator.checkPermission();
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      setState(() {
        konum_hatasi_widget = Hata(metin: "Konum servisi etkin değil!");
      });

    } else {
      if (permission == LocationPermission.denied) {
        setState(() {
          konum_hatasi_widget = Hata(metin: "Konum izni vermediniz!");
        });


      } else {
        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
        double lat = position.latitude;
        double long = position.longitude;

        List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
        String tum_adres = placemarks.toString();
        List<String> satirlar = tum_adres.split(",");
        String il_satiri = satirlar[5].trim();
        String ilce_satiri = satirlar[6].trim();

        setState(() {
          mevcut_konum = ilce_satiri.replaceAll('Subadministrative area: ', '').trim();
        });
      }
    }
  }
}
