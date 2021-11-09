import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horoscope_app/data/strings.dart';
import 'package:horoscope_app/model/burc.dart';
import 'package:horoscope_app/burc_item.dart';

class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;
  BurcListesi() {
    tumBurclar = veriKaynaginiHazirla();
    print(tumBurclar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Burç Listesi'),
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return BurcItem(
            listelenenBurc: tumBurclar[index],
          );
        },
        itemCount: tumBurclar.length,
      )),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarih = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      //Örneğin koc1.png değeri için Koç -> koc
      var burc_KucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '${i + 1}.png';
      //Örneğin koc_buyuk1.png şeklinde olmalıdır.
      var burc_BuyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '_buyuk' + '${i + 1}.png';

      Burc eklenecekBurc =
          Burc(burcAdi, burcTarih, burcDetay, burc_KucukResim, burc_BuyukResim);
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}
