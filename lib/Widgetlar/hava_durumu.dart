import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hava_durumu/Modeller/hava.dart';
import 'package:hava_durumu/Sabitler/hava_durumu_ikonlari.dart';
import 'package:hava_durumu/Sabitler/renkler.dart';
import 'package:hava_durumu/Widgetlar/gosterge.dart';
import 'package:hava_durumu/Widgetlar/hata.dart';
import 'package:hava_durumu/Widgetlar/yukleniyor.dart';
import 'package:weather_icons/weather_icons.dart';

class HavaDurumuBilgileri extends StatefulWidget {
  Future<HavaDurumu> havaDurumu;
  HavaDurumuBilgileri({super.key, required this.havaDurumu});

  @override
  State<HavaDurumuBilgileri> createState() => _HavaDurumuBilgileriState();
}

class _HavaDurumuBilgileriState extends State<HavaDurumuBilgileri> {
  @override
  Widget build(BuildContext context) {
    return Expanded(

      child: FutureBuilder<HavaDurumu>(
        future: widget.havaDurumu,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Yukleniyor(metin: "Yükleniyor");
          } else if (snapshot.hasError) {
            return Hata(metin: "Hata!");
          } else {
            final havaDurumu = snapshot.data!;

            return Container(
              padding: EdgeInsets.all(16.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HavaDurumuIkonu(
                      size: 130,
                      durum: '${havaDurumu.hava_durumu}'),
                  SizedBox(height: 16.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(20,5,20,5),
                    decoration: BoxDecoration(
                        color: renk16,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on_outlined, color: beyaz,),
                        SizedBox(width: 10,),
                        Text(
                          havaDurumu.yer,
                          style: GoogleFonts.merriweatherSans(
                            fontSize: 24.0,
                            color: beyaz,
                          ),
                        ),
                      ],),
                  ),
                  SizedBox(height: 18.0),
                  Text(
                    havaDurumu.hava_durumu + " bekleniyor.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.merriweatherSans(
                      fontSize: 16.0,
                      color: renk16,
                    ),
                  ),
                  SizedBox(height: 18.0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: renk16),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      havaDurumu.sicaklik,
                      style: GoogleFonts.merriweatherSans(
                        fontSize: 52.0,
                        color: renk16,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Gosterge(metin: havaDurumu.ruzgar, ikon: WeatherIcons.wind, renk: renk6),
                      Gosterge(metin: havaDurumu.hissedilen_sicaklik, ikon: WeatherIcons.thermometer, renk:  renk_sirt),
                      Gosterge(metin: havaDurumu.nem_durumu, ikon: WeatherIcons.humidity, renk: renk18),

                    ],
                  ),
                ],
              ),

            );
          }
        },
      ),
    );
  }
}
