import 'dart:convert';
import 'dart:io';

import 'package:app7/uitlities/utilities.dart';
import 'package:app7/widgets/SubmitButton.dart';
import 'package:app7/widgets/textInput.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'addpicture.dart'; // Make sure to import your addPicture.dart file
class createListingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _createListingScreen();
  }
}

class _createListingScreen extends State<createListingScreen> {
  File? selectedImage1;
  File? selectedImage2;
  File? selectedImage3;
  File? selectedImage4;
  File? selectedImage5;
  final ImagePicker picker = ImagePicker();

  var Name = TextEditingController();
  var description = TextEditingController();
  var houseAddress = TextEditingController();
  var bedrooms = TextEditingController();
  var bathrooms = TextEditingController();
  var expectedPrice = TextEditingController();

 int? propertyID; // Variable to store the propertyID

Future<void> createListing() async {
  final apiUrl = "http://localhost:3000/user/create-property";

  // Hardcoded data for testing
  final requestData = {
    "name": Name.text,
    "description": description.text,
    "bedrooms": int.parse(bedrooms.text),
    "bathrooms": int.parse(bathrooms.text),
    "location": houseAddress.text,
    "starting_bid": 4,
    "end_time": "2023-12-31T23:59:59.999",
    "user_username": "ali",
  };

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json", 'authorization': '$JWT'},
      body: jsonEncode(requestData),
    );

    if (response.statusCode == 201) {
      // Parse the propertyID from the response if needed
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final int propertyID = responseData['propertyID'];

      // Set the propertyID in the state
      setState(() {
        this.propertyID = propertyID;
      });

      // Navigate to addPicture and pass the propertyID
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return addPicture(propertyID: propertyID);
          },
        ),
      );
    } else {
      // Handle other response statuses as needed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An error occurred. Please try again."),
        ),
      );
    }
  } catch (e) {
    // Exception occurred, display error message in SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("An error occurred. Please try again."),
      ),
    );
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(80, 208, 52, 41),
        title: Center(child: Text("BidNest")),
      ),
      body: Container(
        color: Color.fromARGB(70, 198, 222, 234),
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 40),
            width: (MediaQuery.of(context).size.width) - 50,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "ENTER YOUR PROPERTY DETAILS  ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 20,
                  ),
                  Text("NAME"),
                  textInput(
                    controller: Name,
                    hintText: "ENTER YOUR NAME",
                    borderRadius: 10,
                    obscure: false,
                  ),
                  Container(
                    height: 20,
                  ),
                  Text("DESCRIPTION "),
                  textInput(
                    controller: description,
                    hintText: "ENTER DESCRIPTION",
                    borderRadius: 10,
                    obscure: false,
                  ),
                  Container(
                    height: 20,
                  ),
                  Text("PROPERTY ADDRESS"),
                  textInput(
                    controller: houseAddress,
                    hintText: "ADDRESS",
                    borderRadius: 10,
                    obscure: false,
                  ),
                  Container(
                    height: 20,
                  ),
                  Text("NUMBER OF BEDROOMS "),
                  textInput(
                    controller: bedrooms,
                    hintText: "NUMBER OF BEDROOMS",
                    borderRadius: 10,
                    obscure: false,
                  ),
                  Container(
                    height: 20,
                  ),
                  Text("NUMBER OF BATHROOMS"),
                  textInput(
                    controller: bathrooms,
                    hintText: "NUMBER OF BATHROOMS",
                    borderRadius: 10,
                    obscure: false,
                  ),
                  Container(
                    height: 20,
                  ),
                 Container(
  margin: EdgeInsets.all(15),
  child: SubmitButton(
    buttonText: "PROCEED UPLOAD IMAGE",
    buttonLength: 150,
    onPressedCallback: () async {
      await createListing();
      if (propertyID != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return addPicture(propertyID: propertyID!);
            },
          ),
        );
      } else {
        propertyID=13;
        // Handle the case where propertyID is null
      }
    },
  ),
),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
