import 'package:flutter/material.dart';
import 'package:reparasi_computer/app/modules/Reparasi/Rekomendasi/moviedesc.dart';


class RekomendasiView extends StatelessWidget {
  final List<String> gambar;
  final List<String> judul;
  final List<String> deskripsi;

  RekomendasiView(
      {required this.gambar, required this.judul, required this.deskripsi});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.86,
        child: GridView.count(
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          padding: EdgeInsets.all(20),
          children: List.generate(
            gambar.length,
            (index) => InkWell(
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        child: Image.asset(
                          gambar[index],
                          height: 300,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              },
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => HeroAnimation2(
                      gambar: gambar[index],
                      judul: judul[index],
                      deskripsi: deskripsi[index],
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: judul[index],
                      child: Image.asset(
                        gambar[index],
                        height: 130,
                        width: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      judul[index],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
