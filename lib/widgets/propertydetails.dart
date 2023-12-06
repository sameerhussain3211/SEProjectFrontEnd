import 'package:app7/widgets/SubmitButton.dart';
import 'package:flutter/material.dart';

class propertyDetails extends StatelessWidget {
  Image? image1;
  Image? image2;
  Image? image3;
  Image? image4;
  Image? image5;
  String? addressOfHouse;
  int? roomsInHouse;
  double? areaInSqFeet;
  double? priceOfHouseInMillions;
  String? descriptionOfHouse;

  propertyDetails({
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.addressOfHouse,
    required this.roomsInHouse,
    required this.areaInSqFeet,
    required this.priceOfHouseInMillions,
    required this.descriptionOfHouse,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(80, 208, 52, 41),
          title: Center(child: Text("BidNest")),
        ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 200,
            child: image1,
          ),
          Container(
            height: 5,
          ),
          Container(
            height: 200,
            child: image2,
          ),
          Container(
            height: 5,
          ),
          Container(
            height: 200,
            child: image3,
          ),
          Container(
            height: 5,
          ),
          Container(
            height: 200,
            child: image4,
          ),
          Container(
            height: 5,
          ),
          Container(
            height: 200,
            child: image5,
          ),
          Container(
            height: 10,
          ),
              Container(
                color: const Color.fromARGB(118, 158, 158, 158),
                child: Text("ADDRESS: $addressOfHouse"),
              ),
          
          Container(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
  
              Container(
                color: const Color.fromARGB(104, 158, 158, 158),
                child: Text("ROOMS: $roomsInHouse"),
              ),
              Container(
                width: 30,
              ),
              Container(
                  color: const Color.fromARGB(104, 158, 158, 158),
                  child: Text("PRICE IN MILLIONS: $priceOfHouseInMillions")),
            ],
          ),
             Container(
                height: 20,
              ),
          Container(
                color: const Color.fromARGB(118, 158, 158, 158),
                child: Text("AREA IN SQ FEET: $areaInSqFeet"),
              ),
              Container(
                height: 20,
              ),

              Text("DESCRIPTION: "),
               Container(
                height: 20,
              ),


           Container(
            padding: EdgeInsets.all(20),
              width: 400,
              child: Text("$descriptionOfHouse"),
            ),
          
          Container(
            height: 40,
          ),
          SubmitButton(
            buttonText: "BID NOW",
            buttonLength: 100,
            onPressedCallback: () {},
          )
        ]),
      ),
    );
  }
}
