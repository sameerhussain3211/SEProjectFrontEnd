import 'package:flutter/material.dart';

class homescreen1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color.fromARGB(80, 208, 52, 41),
        title: Center(child: Text("BidNest")),
        
      ),
      body: Container(color: Colors.amber),
    );
  }

}