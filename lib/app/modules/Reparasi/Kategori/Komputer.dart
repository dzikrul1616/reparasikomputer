import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KomputerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Komputer'),
      ),
      body: Center(
        child: Text('Ini adalah halaman Komputer'),
      ),
    );
  }
}
