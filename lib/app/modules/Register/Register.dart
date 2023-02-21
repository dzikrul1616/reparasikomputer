import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:reparasi_computer/app/modules/Login/views/login_view.dart';
import 'package:reparasi_computer/app/modules/Register/Verifikasi.dart';
import 'package:reparasi_computer/app/modules/Reparasi/Bottom%20Bar/bottomBar.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isRegistering = false;

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username harus diisi';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email harus diisi';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Email tidak valid';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password harus diisi';
    }
    if (value.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  Future<void> _register() async {
    setState(() {
      _isRegistering = true;
    });

    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'username': username,
        'email': email,
      });

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomBar()));
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Terjadi kesalahan';
      if (e.code == 'weak-password') {
        errorMessage = 'Password terlalu lemah';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'Email sudah terdaftar';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Terjadi kesalahan'),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        _isRegistering = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: TextFormField(
                controller: usernameController,
                validator: _validateUsername,
                decoration: const InputDecoration(
                    labelText: 'Username',
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
                controller: emailController,
                validator: _validateEmail,
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
                validator: _validatePassword,
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
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sudah Punya Akun? '),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginView()));
                  },
                  child: Text(
                    'Login',
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              color: Colors.redAccent,
              minWidth: MediaQuery.of(context).size.width,
              height: 50,
              onPressed: _register,
              child: Center(
                child: Text(
                  'Daftar',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
