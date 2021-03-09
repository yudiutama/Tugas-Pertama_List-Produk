import 'package:flutter/material.dart';
import './detail.dart';

void main() {
  runApp(new MaterialApp(
    title: "tab Bar",
    theme: ThemeData(
      primarySwatch: Colors.yellow
    ),
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("List Produk Toko")),
      ),
      body: new ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
        children: <Widget>[
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext content) => DetailProduk(
                          nama: "Penyiram Tanaman",
                          deskripsi: "Free Ongkir || COD",
                          harga: 20000,
                          gambar: "Penyiram.jpg",
                          star: 5,
                        )),
              );
            },
            child: ProductBox(
              nama: "Penyiram Tanaman",
              deskripsi: "Warna Biru, Kualitas Terjamin, Harga yang terjangkau",
              harga: 20000,
              image: "Penyiram.jpg",
              star: 5,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext content) => DetailProduk(
                          nama: "Probiotik EM4",
                          deskripsi: "Free Ongkir || Diskon 30%",
                          harga: 35000,
                          gambar: "Probiotik.jpg",
                          star: 3,
                        )),
              );
            },
            child: ProductBox(
              nama: "Probiotik EM4",
              deskripsi: "Komposis yang baik, mengandng microba baik untuk campuran fermentasi",
              harga: 35000,
              image: "Probiotik.jpg",
              star: 3,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext content) => DetailProduk(
                          nama: "Sprayer",
                          deskripsi: "Free Ongkir || Cashback 30%",
                          harga: 10000,
                          gambar: "Sprayer.jpg",
                          star: 1,
                        )),
              );
            },
            child: ProductBox(
              nama: "Sprayer",
              deskripsi: "Semprotan air sangat bagus, terbuat dari plastik berkualitas, 100% tahan cuaca",
              harga: 10000,
              image: "Sprayer.jpg",
              star: 1,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext content) => DetailProduk(
                          nama: "Bibit",
                          deskripsi: "Bibit unggul, tumbuh cukup cepat, bertahan hingga 1,5 tahun",
                          harga: 5000,
                          gambar: "Bibit.jpg",
                          star: 5,
                        )),
              );
            },
            child: ProductBox(
              nama: "Bibit",
              deskripsi: "Bibit unggul, tumbuh cukup cepat, bertahan hingga 1,5 tahun",
              harga: 5000,
              image: "Bibit.jpg",
              star: 5,
            ),
          )
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox(
      {Key key, this.nama, this.deskripsi, this.harga, this.image, this.star})
      : super(key: key);
  final String nama;
  final String deskripsi;
  final int harga;
  final String image;
  final int star;
  final children = <Widget>[];

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < star; i++) {
      children.add(new Icon(
        Icons.star,
        size: 12,
        color: Colors.yellow,
      ));
    }

    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            "assets/" + image,
            width: 150,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Text(
                    this.nama, //untuk nama
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(this.deskripsi), //deskripsi produk
                  Text(
                    "Harga :" + this.harga.toString(), // harga produk
                    style: TextStyle(color: Colors.orange),
                  ),
                  Row(
                    children: <Widget>[
                      Row(
                        children: children,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}