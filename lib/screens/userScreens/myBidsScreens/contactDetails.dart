import 'package:app7/widgets/SubmitButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class contactDetails extends StatelessWidget {
  Image? img = Image.asset('assects/images/sunflower.jpg');
  int? contactNumber = 03453242234;
  var emailAdress = 'samerrejdshh@gmail.com';
  var Name = 'sameer hussain';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(80, 208, 52, 41),
        title: Center(child: Text("BidNest")),
      ),
      body: Center(
          child: Container(
              child: Column(
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: img,
          ),
          SubmitButton(
            buttonText: "NAME : $Name",
            buttonLength: 300,
            onPressedCallback: () {},
          ),
          Container(
            height: 30,
          ),
          SubmitButton(
            buttonText: "PHONE : $contactNumber",
            buttonLength: 300,
            onPressedCallback: () {},
          ),
          Container(
            height: 30,
          ),
          SubmitButton(
            buttonText: "EMAIL : $emailAdress",
            buttonLength: 300,
            onPressedCallback: () {},
          ),
        ],
      ))),
    );
  }
}
