import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          List items = [
            {
              "id": 1,
              "photo": "assets/movie1.jpg",
              "onTap": (item) {},
            },
            {
              "id": 2,
              "photo": "assets/movie2.jpg",
              "onTap": (item) {},
            },
            {
              "id": 3,
              "photo": "assets/movie3.jpg",
              "onTap": (item) {},
            },
            {
              "id": 4,
              "photo": "assets/movie4.jpg",
              "onTap": (item) {},
            },
            {
              "id": 5,
              "photo": "assets/movie5.jpg",
              "onTap": (item) {},
            },
            {
              "id": 6,
              "photo": "assets/movie6.jpg",
              "onTap": (item) {},
            },
          ];

          return SizedBox(
            height: 120.0,
            child: ListView.builder(
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var item = items[index];
                return Container(
                  height: 100.0,
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: const EdgeInsets.only(right: 16.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        item["photo"],
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        16.0,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
