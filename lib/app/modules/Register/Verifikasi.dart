import 'dart:async';
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:reparasi_computer/app/modules/home/views/home_view.dart';

class VerifikasiView extends StatefulWidget {
  const VerifikasiView({Key? key}) : super(key: key);

  @override
  State<VerifikasiView> createState() => _VerifikasiViewState();
}

class _VerifikasiViewState extends State<VerifikasiView> {
  bool verifyEmail = false;
  Timer? timer;
  bool canResendEmail = false;
  @override
  Widget build(BuildContext context) {
    return verifyEmail
        ? HomeView()
        : Scaffold(
            body: Padding(
                padding: EdgeInsets.all(20),
                child: Column(children: [
                  Center(
                    child: Text('Verifikasi sudah dikirim ke   email kamu'),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  MaterialButton(
                    onPressed: canResendEmail ? sendVerifyEmail : null,
                    child: Center(
                      child: Text("Kirim Ulang"),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () => FirebaseAuth.instance.signOut(),
                    child: Center(
                      child: Text("Cancel"),
                    ),
                  )
                ])));
  }

  @override
  void initState() {
    super.initState();
    verifyEmail = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!verifyEmail) {
      sendVerifyEmail();
      timer = Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      verifyEmail = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (verifyEmail) timer?.cancel();
  }

  Future<void> sendVerifyEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 3));
      setState(() => canResendEmail = true);
    } catch (e) {
      print(e.toString());
    }
  }
}
