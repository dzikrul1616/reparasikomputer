import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reparasi_computer/app/modules/Reparasi/Bottom%20Bar/bottomBar.dart';
import 'package:reparasi_computer/app/modules/home/views/home_view.dart';

class RowBanner extends StatelessWidget {
  const RowBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        List items = [
          {
            "id": 1,
            "photo":
                "https://i.ibb.co/6NZ8dGk/Holiday-Travel-Agent-Promotion-Banner-Landscape.png",
            "onTap": (item) {},
          },
          {
            "id": 2,
            "photo": "https://i.ibb.co/5xfjdy9/Blue-Modern-Discount-Banner.png",
            "onTap": (item) {},
          },
          {
            "id": 3,
            "photo":
                "https://i.ibb.co/6Rvjyy1/Brown-Yellow-Free-Furniture-Promotion-Banner.png",
            "onTap": (item) {},
          }
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
                margin: const EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeView()));
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
