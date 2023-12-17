import 'dart:io';
import 'package:app7/screens/userScreens/userHomeScreen.dart';

import 'package:app7/uitlities/utilities.dart';
import 'package:app7/widgets/SubmitButton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class addPicture extends StatefulWidget {
  final int propertyID; // Added propertyID as a parameter

  addPicture({required this.propertyID});


  @override
  State<StatefulWidget> createState() {
    return _addpicture();
  }
}

class _addpicture extends State<addPicture> {
  File? selectedImage1;
  File? selectedImage2;
  File? selectedImage3;
  File? selectedImage4;
  File? selectedImage5;
  final ImagePicker picker = ImagePicker();


   Future<void> uploadPictures() async {
  final apiUrl = "http://localhost:3000/user/upload-pictures";

  final Map<String, String> headers = {
    "Content-Type": "application/json",
    'authorization': '$JWT', // Make sure JWT is defined
  };

  // Convert requestData values to String
  final Map<String, String> requestData = {
    "propertyID": widget.propertyID.toString(),
  };

  final List<File?> images = [
    selectedImage1,
    selectedImage2,
    selectedImage3,
    selectedImage4,
    selectedImage5,
  ];

  final List<String> imageFieldNames = [
    "image1",
    "image2",
    "image3",
    "image4",
    "image5",
  ];

  try {
    final request = http.MultipartRequest('POST', Uri.parse(apiUrl));

    for (int i = 0; i < images.length; i++) {
      if (images[i] != null) {
        request.files.add(await http.MultipartFile.fromPath(
          imageFieldNames[i],
          images[i]!.path,
        ));
      }
    }

    request.headers.addAll(headers);
    request.fields.addAll(requestData);

    final response = await request.send();

    print('Response status: ${response.statusCode}');
    print('Response body: ${await response.stream.bytesToString()}');
  } catch (e) {
    print("Error uploading pictures: $e");
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
                    "ENTER YOUR PROPERTY PICTURES  ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 20,
                  ),
                  Text("SELECT IMAGE 1"),
                  Container(
                    height: 5,
                  ),
                  _buildImageSelectionButton(1, selectedImage1),
                  Container(
                    height: 20,
                  ),
                  Text("SELECT IMAGE 2"),
                  Container(
                    height: 5,
                  ),
                  _buildImageSelectionButton(2, selectedImage2),
                  Container(
                    height: 20,
                  ),
                  Text("SELECT IMAGE 3"),
                  Container(
                    height: 5,
                  ),
                  _buildImageSelectionButton(3, selectedImage3),
                  Container(
                    height: 20,
                  ),
                  Text("SELECT IMAGE 4"),
                  Container(
                    height: 5,
                  ),
                  _buildImageSelectionButton(4, selectedImage4),
                  Container(
                    height: 20,
                  ),
                  Text("SELECT IMAGE 5"),
                  Container(
                    height: 5,
                  ),
                  _buildImageSelectionButton(5, selectedImage5),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: SubmitButton(
                      buttonText: "UPLOAD PICTURES",
                      buttonLength: 150,
                      onPressedCallback: () {
                        uploadPictures();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return userHomeScreen();
                            },
                          ),
                        );
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

  Future getImage(int buttonNumber) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        switch (buttonNumber) {
          case 1:
            selectedImage1 = File(image.path);
            break;
          case 2:
            selectedImage2 = File(image.path);
            break;
          case 3:
            selectedImage3 = File(image.path);
            break;
          case 4:
            selectedImage4 = File(image.path);
            break;
          case 5:
            selectedImage5 = File(image.path);
            break;
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nothing is selected')),
        );
      }
    });
  }

  Widget _buildImageSelectionButton(int buttonNumber, File? selectedImage) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            child: const Text('Select Image from Gallery'),
            onPressed: () {
              getImage(buttonNumber);
            },
          ),
          selectedImage == null
              ? const Center(child: Text('Sorry, nothing selected!!'))
              : Image.network(selectedImage.path),
        ],
      ),
    );
  }
}
