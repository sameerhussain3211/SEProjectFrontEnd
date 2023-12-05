import 'package:app7/widgets/SubmitButton.dart';
import 'package:flutter/material.dart';

class propertyDetails extends StatelessWidget{
  Image? image1;
  Image? image2;
  Image? image3;
  Image? image4;
  Image? image5;
  String ?regionName;
  String ?cityName;
  int ?roomsInHouse;
  double ?areaOfHouseInMarla;
  double ?priceOfHouseInMillions;
  String ?descriptionOfHouse;

    propertyDetails({
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.regionName,
    required this.cityName,
    required this.roomsInHouse,
    required this.areaOfHouseInMarla,
    required this.priceOfHouseInMillions,
    required this.descriptionOfHouse,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 200,
            child: image1,
        
          ),
          Container(height: 5,),
           Container(
            height: 200,
            child: image2,
        
          ),
          Container(height: 5,),
           Container(
           height: 200,
            child: image3,
        
          ),
          Container(height: 5,),
           Container(
            height: 200,
            child: image4,
        
          ),
                    Container(height: 5,),
           Container(
            height: 200,
            child: image5,
        
          ),
                  Container(height: 10,),
          Row(
            children: [
              Container(
                color: const Color.fromARGB(118, 158, 158, 158),
                child: Text("AREA IN MARLA: $areaOfHouseInMarla"),),
                Container(width: 20,),
                Container(
                color: const Color.fromARGB(118, 158, 158, 158),
                child: Text("CITY: $areaOfHouseInMarla"),),
            ],
          ),
        
            Container(height: 10,),
        Row(
          children: [
            Container(
              color: const Color.fromARGB(94, 158, 158, 158),
              child: Text("REGION: $regionName"),
            ),
            Container(width: 30,),
            Container(
              color: const Color.fromARGB(104, 158, 158, 158),
              child: Text("ROOMS: $roomsInHouse"),
            ),
            Container(width: 30,),
             Container(color: const Color.fromARGB(104, 158, 158, 158),
              child: Text("PRICE IN MILLIONS: $priceOfHouseInMillions")),
          ],
         
        
        ),
        Container(height: 20,),
         Container(
          width: 400,
          child: Text("$descriptionOfHouse"),
            
          ),
          Container(height: 40,),

         SubmitButton(buttonText: "BID NOW", buttonLength: 100,
         onPressedCallback: (){
          

         },
         )
        
        
        ]),
      ),
    );

  }

}