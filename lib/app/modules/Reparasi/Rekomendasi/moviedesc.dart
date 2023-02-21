import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroAnimation2 extends StatefulWidget {
  final String gambar;
  final String judul;
  final String deskripsi;

  HeroAnimation2({
    required this.gambar,
    required this.judul,
    required this.deskripsi,
  });

  @override
  _HeroAnimation2State createState() => _HeroAnimation2State();
}

class _HeroAnimation2State extends State<HeroAnimation2> {
  int _count = 0;
  bool _isFavourite = false;

  void _toggleFavorite() {
    setState(() {
      if (_isFavourite) {
        _count--;
      } else {
        _count++;
      }
      _isFavourite = !_isFavourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Hero(
              tag: widget.gambar,
              child: Image.asset(
                widget.gambar,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16.0),
                        Text(
                          'Andrew',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'andrew@gmail.com',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 16.0),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            _isFavourite ? Icons.star : Icons.star_border,
                            color: _isFavourite ? Colors.yellow : null,
                          ),
                          onPressed: _toggleFavorite,
                        ),
                        Text(
                          '$_count',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.judul,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                widget.deskripsi.length > 1000
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.deskripsi.substring(0, 1000) + '...',
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      )
                    : Text(
                        widget.deskripsi,
                        textAlign: TextAlign.justify,
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
