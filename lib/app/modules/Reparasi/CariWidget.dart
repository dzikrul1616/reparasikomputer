import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CariWidget extends StatelessWidget {
  const CariWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 12.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration.collapsed(
                fillColor: Colors.transparent,
                hintText: "Cari service",
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                ),
                hoverColor: Colors.transparent,
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.tune),
                    const SizedBox(
                      width: 2.0,
                    ),
                    Text('Filter'),
                  ],
                ),
                style: ElevatedButton.styleFrom(primary: Colors.amber),
              )),
        ],
      ),
    );
  }
}
