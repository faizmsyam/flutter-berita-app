import 'package:berita_app/beranda/detail.dart';
import 'package:flutter/material.dart';
import 'package:berita_app/models/berita_data.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  List<BeritaData> newDataBerita = List.from(listDataBerita);

  onItemChanged(String value) {
    setState(() {
      newDataBerita = listDataBerita
          .where((string) => string.judul.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.white,
          // title: Text('List Berita', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          title: Image.asset('assets/images/beritaq-logo.png', fit: BoxFit.cover),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10, left: 8, right: 8),
              child: TextField(
                style: TextStyle(
                    fontSize: 16.0,
                    height: 0.8,
                    color: Colors.black
                ),
                onChanged: onItemChanged,
                decoration: InputDecoration(
                    hintText: 'Pencarian Berita...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)))),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: newDataBerita.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return DetailBerita(berita: newDataBerita[index]);
                            }));
                          },
                          child: Card(
                            elevation: 0.0,
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(newDataBerita[index].gambar),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          newDataBerita[index].judul,
                                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(newDataBerita[index].waktu, style: TextStyle(fontSize: 11.0, color: Colors.grey)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            ),
          ],
        ),
      ),
    );
  }
}
