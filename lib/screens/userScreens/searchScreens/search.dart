import 'package:app7/homescreen1.dart';
import 'package:app7/screens/userScreens/searchScreens/viewProperty.dart';
import 'package:app7/widgets/CustomDropDown.dart';
import 'package:app7/widgets/propertyList.dart';
import 'package:flutter/material.dart';

class search extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return _search();
  }

}

class _search extends State<search> {
  List<String> region=['SINDH','BOLOCHISTAN','PUNJAB', 'KP', 'GILGIT-BALTISTAN','KASHMIR'];
  List<String> city=['KARACHI','LAHORE','PESHAWAR','GILGIT','QUETTA','OTHER'];
  List<String> rooms=['1','2','3','4','5','6','MORE'];
  List<String> area=['10 MARLA','1 KANAL', '1.5 KANAL', '2 KANAL','OTHER'];
  List<String> priceRange=['LESS THAN MILLION','1 MILLION TO 1 CRORE', '1 TO 10 CRORE', 'MORE THAN 10 CRORE',];
  String ?regionName;
  String ?cityName;
  String ?roomsInHouse;
  String ?areaOfHouse;
  String ?priceOfHouse;
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(80, 208, 52, 41),
        title: Center(child: Text("BidNest")),
        
      ),
      body: Column(
        
        children: [
          Container( 
             color: Color.fromARGB(49, 68, 196, 255),
            child: Column(
            children: [ 
         Row(
          children: [
                CustomDropdown(height: 30, width: 220, items: region,
               hint: "REGION", onChanged: (String newValue) {
                regionName=newValue;
  }), 
  Container(width: 20,),
                CustomDropdown(height: 30, width: 220, items: city,
               hint: "CITY", onChanged: (String newValue) {
                cityName=newValue;
  }), 
          ],
         ),
         Container(height: 10,),
                  Row(
          children: [
                CustomDropdown(height: 30, width: 220, items: rooms,
               hint: "ROOMS", onChanged: (String newValue) {
                roomsInHouse=newValue;
  }), 
  Container(width: 20,),
                CustomDropdown(height: 30, width: 220, items: area,
               hint: "AREA", onChanged: (String newValue) {
                areaOfHouse=newValue;
  }),
  
          ],
         ),
         Container(height: 10,),
   CustomDropdown(height: 30, width: 220, items: priceRange,
               hint: "PRICE RANGE", onChanged: (String newValue) {
                priceOfHouse=newValue;
  }),
  Container(height: 10,),
        ]),),
  
  

  Expanded(
  flex: 30,
  child: Container(
    color: const Color.fromARGB(50, 68, 137, 255),
    child: ListView.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8), 
        // Added comma here
        child:   InkWell(
          child: propertyList(
                 img: Image.asset('assects/images/sunflower.jpg'), // Corrected img parameter
           AdressHouse: 'hello,jhjs ,232,dfsdf',
             locationHouse: 'Sindh',
             price: 100000,
          roomNum: 4,),

          onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context){return viewproperty();}));},
               
        )
      ),
      itemCount: 20, scrollDirection: Axis.vertical,
    ),
  ),
)
  
      ]),      
      );
  }
  }


 