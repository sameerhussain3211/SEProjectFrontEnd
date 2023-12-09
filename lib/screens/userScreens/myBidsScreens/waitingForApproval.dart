import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class waitingForApproval extends StatelessWidget {
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
  var desc = "balah blah blah";
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
                leading: CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  backgroundImage: img,
                  radius: 30,
                ),
                title: Text(arr1[index]),
                subtitle: Text(
                  "$desc ",
                  style: TextStyle(fontFamily: 'font1'),
                ),
                trailing: FaIcon(FontAwesomeIcons.clock)),
          );
        },
        itemCount: arr1.length,
      ),
    );
  }
}
