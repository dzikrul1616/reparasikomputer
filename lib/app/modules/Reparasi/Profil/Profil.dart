import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:reparasi_computer/app/modules/Login/views/login_view.dart';
import 'package:reparasi_computer/app/modules/home/views/home_view.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.amber,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                maxHeight: 110.0,
              ),
              width: MediaQuery.of(context).size.width,
              color: Colors.amber,
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage('assets/movie1.jpg'),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                          ),
                        ),
                        Text(
                          user.email!,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 16.0,
                      backgroundColor: Colors.blueGrey[900],
                      child: const Icon(
                        Icons.edit,
                        size: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20.0,
                top: 20.0,
                right: 20.0,
                bottom: 20.0,
              ),
              child: Builder(
                builder: (context) {
                  List items = [
                    {
                      "label": "Addresses",
                      "icon": Icons.pin_drop,
                      "on_tap": () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeView()));
                      }
                    },
                    {
                      "label": "Referral code",
                      "icon": Icons.code,
                      "on_tap": () {}
                    },
                    {
                      "label": "Privacy Policy",
                      "icon": Icons.info,
                      "on_tap": () {}
                    },
                    {"label": "TOS", "icon": Icons.warning, "on_tap": () {}}
                  ];

                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 12.0,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: items.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var item = items[index];
                          return InkWell(
                            onTap: () {
                              if (item["on_tap"] != null) {
                                item["on_tap"]!();
                              }
                            },
                            child: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: ListTile(
                                  leading: Icon(
                                    item["icon"],
                                    size: 30.0,
                                  ),
                                  title: Text(item["label"]),
                                  trailing: const Icon(
                                    Icons.chevron_right,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      print("Signed Out");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginView()));
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'LogOut',
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      )
                    ],
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
