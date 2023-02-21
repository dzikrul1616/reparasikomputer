import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reparasi_computer/app/modules/Register/REgister.dart';
import 'package:reparasi_computer/app/modules/Reparasi/Bottom%20Bar/bottomBar.dart';
import 'package:reparasi_computer/app/modules/home/views/home_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        Get.snackbar("Error", "Email tidak ditemukan",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      } else if (e.code == "wrong-password") {
        Get.snackbar("Error", "Password salah",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      } else {
        Get.snackbar("Error", "Login Gagal",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    }

    return user;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: TextFormField(
                controller: emailController,
                validator: (val) {
                  return val!.isEmpty ? "Tidak Boleh Kosong" : null;
                },
                decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    suffixIcon: Icon(
                      Icons.email,
                    ),
                    border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              child: TextFormField(
                controller: passwordController,
                validator: (val) {
                  return val!.isEmpty ? "Tidak Boleh Kosong" : null;
                },
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    suffixIcon: Icon(
                      Icons.password,
                    ),
                    border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Belum Punya Akun? '),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterView()));
                  },
                  child: Text(
                    'Daftar disini',
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              height: 50,
              minWidth: MediaQuery.of(context).size.width,
              color: Colors.redAccent,
              onPressed: () async {
                if (emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  Get.snackbar(
                      "Error", "Email atau password tidak boleh kosong",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white);
                } else {
                  User? user = await loginUsingEmailPassword(
                      email: emailController.text,
                      password: passwordController.text,
                      context: context);
                  print(user);
                  if (user != null) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => BottomBar()));
                  } else {
                    Get.snackbar("Error", "Login Gagal",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white);
                  }
                }
              },
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
