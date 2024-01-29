import 'package:flutter/material.dart';
import 'package:products_app/data/entity/products.dart';
import 'package:products_app/ui/views/anasayfa.dart';

class DetaySayfa extends StatefulWidget {
  Products urun;
  DetaySayfa({required this.urun});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text(
          widget.urun.ad,
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.urun.resim}"),
            Text(
              "${widget.urun.fiyat} ₺",
              style: const TextStyle(fontSize: 50, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
