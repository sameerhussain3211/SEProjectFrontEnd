import 'package:flutter/material.dart';

class propertyList extends StatelessWidget {
  Image? img;
  String? AdressHouse;
  String? name;
  double? price;
  int? roomNum;

  propertyList({
    required this.img,
    required this.AdressHouse,
    required this.name,
    required this.price,
    required this.roomNum,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            color: const Color.fromARGB(103, 158, 158, 158),
            height: 200,
            child: img),
        Container(
          height: 10,
        ),
        Container(
          color: const Color.fromARGB(118, 158, 158, 158),
          child: Text("ADDRESS: $AdressHouse"),
        ),
        Container(
          height: 10,
        ),
        Row(
          children: [
            Container(
              color: const Color.fromARGB(94, 158, 158, 158),
              child: Text("NAME: $name"),
            ),
            Container(
              width: 30,
            ),
            Container(
              color: const Color.fromARGB(104, 158, 158, 158),
              child: Text("ROOMS: $roomNum"),
            ),
            Container(
              width: 30,
            ),
            Container(
                color: const Color.fromARGB(104, 158, 158, 158),
                child: Text("PRICE: $price")),
          ],
        ),
      ],
    );
  }
}
