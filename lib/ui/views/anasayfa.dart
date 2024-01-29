import 'package:flutter/material.dart';
import 'package:products_app/data/entity/products.dart';
import 'package:products_app/ui/views/detay_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Future<List<Products>> urunleriYukle() async {
    var urunlerListesi = <Products>[];
    var u1 = Products(
        id: 1, ad: "Macbook Pro 14", resim: "bilgisayar.png", fiyat: 43000);
    var u2 = Products(
        id: 2, ad: "Rayban Club Master", resim: "gozluk.png", fiyat: 2500);
    var u3 = Products(
        id: 3, ad: "Sony ZX Series", resim: "kulaklik.png", fiyat: 40000);
    var u4 =
        Products(id: 4, ad: "Gio Armani", resim: "parfum.png", fiyat: 2000);
    var u5 =
        Products(id: 5, ad: "Casio X Series", resim: "saat.png", fiyat: 8000);
    var u6 =
        Products(id: 6, ad: "Dyson V8", resim: "supurge.png", fiyat: 18000);
    var u7 =
        Products(id: 7, ad: "IPhone 13", resim: "telefon.png", fiyat: 32000);
    urunlerListesi.add(u1);
    urunlerListesi.add(u2);
    urunlerListesi.add(u3);
    urunlerListesi.add(u4);
    urunlerListesi.add(u5);
    urunlerListesi.add(u6);
    urunlerListesi.add(u7);
    return urunlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text(
          "Ürünler",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black12,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Anasayfa()));
          },
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
        ),
      ),
      body: FutureBuilder<List<Products>>(
        future: urunleriYukle(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var urunlerListesi = snapshot.data;
            return ListView.builder(
              itemCount: urunlerListesi!.length, //7
              itemBuilder: (context, indeks) {
                //0,1,2,3,4,5,6
                var urun = urunlerListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetaySayfa(urun: urun)));
                  },
                  child: Card(
                    color: Colors.black12,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: 128,
                              height: 128,
                              child: Image.asset("images/${urun.resim}")),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              urun.ad,
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${urun.fiyat} ₺",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                AlertDialog alert = AlertDialog(
                                  title: Text("Sepet"),
                                  content: Text("${urun.ad} sepete eklendi."),
                                  actions: [
                                    TextButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert;
                                  },
                                );

                                //print("${urun.ad} sepete eklendi");
                              },
                              child: const Text("Sepet Ekle"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
