import 'package:app7/screens/userScreens/viewListingsScreens/acceptRejectBids.dart';
import 'package:flutter/material.dart';
import 'package:app7/widgets/propertyList.dart';

class viewList extends StatelessWidget {

  int totalNumberList=20;
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(80, 208, 52, 41),
        title: Center(child: Text("BidNest")),
      ),
      body: Expanded(
        flex: totalNumberList,
        child: Container(
          color: const Color.fromARGB(50, 68, 137, 255),
          child: ListView.builder(
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8),
                // Added comma here
                child: InkWell(
                  child: propertyList(
                    img: Image.asset('assects/images/sunflower.jpg'), // Corrected img parameter
                    AdressHouse: "karachi, pakistan, asia",
                    areaInSqFeet: 1000,
                    price: 1000000,
                    roomNum: 4,
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return acceptreject();
                    }));
                  },
                )),
            itemCount: 20,
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }
}
