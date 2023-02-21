import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserCredential?>(
      future: _auth.signInAnonymously(), // otentikasi pengguna secara anonim
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data!.user != null) {
            // jika pengguna sudah login sebelumnya, navigasi ke halaman beranda
            return GetMaterialApp(
              title: "Application",
              initialRoute: Routes.HOME,
              getPages: AppPages.routes,
            );
          } else {
            // jika pengguna belum login sebelumnya, navigasi ke halaman login
            return GetMaterialApp(
              title: "Application",
              initialRoute: Routes.LOGIN,
              getPages: AppPages.routes,
            );
          }
        } else {
          // tampilkan tampilan loading saat menunggu proses autentikasi selesai
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
