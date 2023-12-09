import 'package:app7/screens/userScreens/searchScreens/viewProperty.dart';
import 'package:app7/widgets/CustomDropDown.dart';
import 'package:app7/widgets/propertyList.dart';
import 'package:app7/widgets/rangeSlider.dart';
import 'package:flutter/material.dart';

class search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _search();
  }
}

class _search extends State<search> {
  List<String> region = [
    'SINDH',
    'BOLOCHISTAN',
    'PUNJAB',
    'KP',
    'GILGIT-BALTISTAN',
    'KASHMIR'
  ];
  List<String> city = [
    'KARACHI',
    'LAHORE',
    'PESHAWAR',
    'GILGIT',
    'QUETTA',
    'OTHER'
  ];
  List<String> rooms = ['1', '2', '3', '4', '5', '6', '7'];
  List<String> areaInSqfeet = [
    '800',
    '1000',
    '1500',
    '2000',
    '3000',
    '2500',
    '3000',
    '5000',
    '10000'
  ];
  List<String> priceRange = [
    'LESS THAN MILLION',
    '1 MILLION TO 1 CRORE',
    '1 TO 10 CRORE',
    'MORE THAN 10 CRORE',
  ];
  String? regionName;
  String? cityName;
  String? roomsInHouse;
  String? areaOfHouse;
  String? priceOfHouse;
  double? lowerLimitForBid;
  double? upperLimitForBid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(80, 208, 52, 41),
        title: Center(child: Text("BidNest")),
      ),
      body: Column(children: [
        Center(
          child: Container(
            color: Color.fromARGB(49, 68, 196, 255),
            child: Column(children: [
              Row(
                children: [
                  CustomDropdown(
                      height: 30,
                      width: 180,
                      items: region,
                      hint: "REGION",
                      onChanged: (String newValue) {
                        regionName = newValue;
                      }),
                  Container(
                    width: 10,
                  ),
                  CustomDropdown(
                      height: 30,
                      width: 180,
                      items: city,
                      hint: "CITY",
                      onChanged: (String newValue) {
                        cityName = newValue;
                      }),
                ],
              ),
              Container(
                height: 10,
              ),
              Row(
                children: [
                  CustomDropdown(
                      height: 30,
                      width: 180,
                      items: rooms,
                      hint: "ROOMS",
                      onChanged: (String newValue) {
                        roomsInHouse = newValue;
                      }),
                  Container(
                    width: 10,
                  ),
                  CustomDropdown(
                      height: 30,
                      width: 180,
                      items: areaInSqfeet,
                      hint: "AREA",
                      onChanged: (String newValue) {
                        areaOfHouse = newValue;
                      }),
                ],
              ),
              Container(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "PRICE RANGE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 10,
                  ),
                  CustomRangeSlider(
                    upperLimit: 1000,
                    onRangeChanged: (lower, upper) {
                      upperLimitForBid = upper;
                      lowerLimitForBid = lower;
                      print('Lower Limit: $lowerLimitForBid');
                      print('Upper Limit: $upperLimitForBid');
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print("SEARCH");
                      },
                      child: Icon(Icons.search))
                ],
              ),
              Container(
                height: 10,
              ),
            ]),
          ),
        ),
        Expanded(
          flex: 30,
          child: Container(
            color: const Color.fromARGB(50, 68, 137, 255),
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8),
                  // Added comma here
                  child: InkWell(
                    child: propertyList(
                      img: Image.asset(
                          'assects/images/sunflower.jpg'), // Corrected img parameter
                      AdressHouse: 'hello,jhjs ,232,dfsdf',
                      areaInSqFeet: 1000,
                      price: 100000,
                      roomNum: 4,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return viewproperty();
                      }));
                    },
                  )),
              itemCount: 20,
              scrollDirection: Axis.vertical,
            ),
          ),
        )
      ]),
    );
  }
}
