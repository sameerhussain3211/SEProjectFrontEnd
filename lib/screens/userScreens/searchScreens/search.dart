// ignore_for_file: duplicate_import

import 'dart:convert';
import 'package:app7/screens/userScreens/searchScreens/viewProperty.dart';
import 'package:app7/uitlities/utilities.dart';
import 'package:app7/widgets/CustomDropDown.dart';
import 'package:app7/widgets/propertyList.dart';
import 'package:app7/widgets/rangeSlider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app7/uitlities/utilities.dart';

class search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _search();
  }
}

class _search extends State<search> {
  // String? authToken = '';
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
    'ISLAMABAD',
    'MULTAN',
    'OTHERS'
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

  String? regionName;
  String? cityName;
  String? roomsInHouse;
  String? areaOfHouse;
  double? lowerLimitForBid;
  double? upperLimitForBid;

  Future performPropertySearch() async {
    final String apiUrl = 'http://localhost:3000/user/search-property';

// Prepare the request body
  Map<String, dynamic> requestBody = {
    "region": regionName,
    "city": cityName,
    "roomsInHouse": roomsInHouse,
    "areaOfHouse": areaOfHouse,
    "priceOfHouse": 1000, // Replace with an appropriate default value or handle separately
    "lower_limit": lowerLimitForBid,
    "upper_limit": upperLimitForBid,
    "bedrooms": int.parse(roomsInHouse ?? "0"), // Assuming bedrooms is an integer
  };

    try {
      final response = await http.post(
        
        Uri.parse(apiUrl),
        body: jsonEncode(requestBody),
        headers: {
          'Content-Type': 'application/json',
          'authorization': '$JWT'},
      );
      

      if (response.statusCode == 200) {
        // Successful response, you can handle the result here
        print("Search successful");
        print(response.body);
        return response.body;

        // Parse the response and update your UI accordingly
        // For example, you might want to update the property list based on the search results
      } else {
        // Handle error response
        print("Error: ${response.statusCode}");
        print(response.body);
        // Display an error message to the user
        return [];

      }
    } catch (error) {
      // Handle network or other errors
      print("Error: $error");
      return [];
      // Display an error message to the user
    }

  }

  bool shohSearData = false;

  @override
  Widget build(BuildContext context) {
    print(" THIS IS MY TOKEN YEHHH $JWT");
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
                    "PRICE MILLIONS",
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
                    onPressed: ()async{
                      await performPropertySearch();
                      setState(() {
                        shohSearData = true;
                      });
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

     shohSearData
    ? FutureBuilder(
        future: performPropertySearch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            var apiData = json.decode(snapshot.data);
            print("API Data Length: ${apiData.length}");

            return Container(
              child: Expanded(
                child: Container(
                  color: Color.fromARGB(49, 99, 108, 124),
                  child: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        child: propertyList(
                          img: Image.asset('assects/images/sunflower.jpg'),
                          AdressHouse: apiData[index]['location'].toString(),
                          name: apiData[index]['name'].toString(),
                          price: double.parse(apiData[index]['starting_bid'].toString()),
                          roomNum: int.parse(apiData[index]['bedrooms'].toString()),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return viewproperty();
                          }));
                        },
                      ),
                    ),
                    itemCount: 1,
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ),
            );
          }
        },
      )
    : Text(''),

        // Expanded(
        //   flex: 30,
        //   child: Container(
        //     color: const Color.fromARGB(50, 68, 137, 255),
        //     child: ListView.builder(
        //       itemBuilder: (context, index) => Padding(
        //           padding: const EdgeInsets.all(8),
        //           // Added comma here
        //           child: InkWell(
        //             child: propertyList(
        //               img: Image.asset(
        //                   'assects/images/sunflower.jpg'), // Corrected img parameter
        //               AdressHouse: 'hello,jhjs ,232,dfsdf',
        //               areaInSqFeet: 1000,
        //               price: 100000,
        //               roomNum: 4,
        //             ),
        //             onTap: () {
        //               Navigator.push(context,
        //                   MaterialPageRoute(builder: (context) {
        //                 return viewproperty();
        //               }));
        //             },
        //           )),
        //       itemCount: 20,
        //       scrollDirection: Axis.vertical,
        //     ),
        //   ),
        // )
      ]),
    );
  }
}
