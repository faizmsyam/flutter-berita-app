import 'package:flutter/material.dart';
import 'package:berita_app/models/berita_data.dart';

class DetailBerita extends StatelessWidget {

  final BeritaData berita;
  DetailBerita({required this.berita});

  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
              IconButton(icon: Icon(Icons.share), onPressed: () {})
            ],
            elevation: 0,
            floating: false,
            expandedHeight: 250,
            pinned: true,
            snap: false,
            stretch: true,
            actionsIconTheme: IconThemeData(opacity: 0.0),
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                    child: Image.asset(
                    berita.gambar,
                    fit: BoxFit.cover,
                    ))
              ],
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            berita.judul,
                            textAlign: TextAlign.left,
                            style:
                            TextStyle(fontWeight: FontWeight.w900, fontSize: 25.0),
                          )),
                      Divider(),
                      Column(
                        children: [
                          Text(berita.penulis, style: TextStyle(color: Colors.grey[500])),
                          Text(berita.waktu, style: TextStyle(color: Colors.grey[500])),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                            berita.deskripsi,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            hasScrollBody: false,
          ),
        ],
      ),
    );
  }
}