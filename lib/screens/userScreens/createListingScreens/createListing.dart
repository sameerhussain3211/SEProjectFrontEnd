import 'dart:io';
import 'package:app7/screens/userScreens/userHomeScreen.dart';
import 'package:app7/widgets/SubmitButton.dart';
import 'package:app7/widgets/textInput.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
                    margin: EdgeInsets.only(
                        top: 20, left: 40, right: 40, bottom: 40),
                    width: (MediaQuery.of(context).size.width) - 50,
                    child: SingleChildScrollView(
                        child: Column(children: [
                      Text(
                        "ENTER YOUR PROPERTY DETAILS  ",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
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
                        obscure: true,
                      ),
                      Container(
                        height: 20,
                      ),
                      _buildImageSelectionButton(1, selectedImage1),
                      Container(
                        height: 20,
                      ),
                      _buildImageSelectionButton(2, selectedImage2),
                      Container(
                        height: 20,
                      ),
                      _buildImageSelectionButton(3, selectedImage3),
                      Container(
                        height: 20,
                      ),
                      _buildImageSelectionButton(4, selectedImage4),
                      Container(
                        height: 20,
                      ),
                      _buildImageSelectionButton(5, selectedImage5),
                      Container(
                          margin: EdgeInsets.all(15),
                          child: SubmitButton(
                              buttonText: "CREATE",
                              buttonLength: 150,
                              onPressedCallback: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return userHomeScreen();
                                    },
                                  ),
                                );
                              }))
                    ]))))));
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
