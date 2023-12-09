import 'package:app7/screens/userScreens/userHomeScreen.dart';
import 'package:app7/widgets/SubmitButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class acceptreject extends StatelessWidget {
  var arr1 = [
    'sameer',
    'dingo ',
    'yasir',
    'latif',
    'john',
    'jordie',
    'kakak',
    'pom',
    'tamm',
    'sameer',
    'dingo ',
    'yasir',
    'latif',
    'john',
    'jordie',
    'kakak',
    'pom',
    'tamm'
  ];
  double bidPrice = 10000;
  ImageProvider img = AssetImage('assects/images/sunflower.jpg');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(80, 208, 52, 41),
        title: Center(child: Text("BidNest")),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            shadowColor: Colors.green,
            child: ListTile(
             
              title: Text(arr1[index]),
              subtitle: Text("PRICE: $bidPrice"),
              trailing: Column(
                children: [
                  InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return userHomeScreen();
                          }));
                        },
                        child: Icon(Icons.fact_check, color: Colors.green,)),
                  
                
                   InkWell(
                        onTap: () {
                          print("rejected bid");
                        },
                        child: Icon(Icons.cancel, color: Colors.red,)),
                 
                ],
              ),
            ),
          );
        },
        itemCount: arr1.length,
      ),
    );
  }
}
