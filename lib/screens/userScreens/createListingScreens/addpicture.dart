import 'dart:io';
import 'package:app7/screens/userScreens/userHomeScreen.dart';
import 'package:app7/widgets/SubmitButton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class addPicture extends StatefulWidget {
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
                        "ENTER YOUR PROPERTY PICTURES  ",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
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
                      Text("SELECT IMAGE 5"),
                      Container(
                        height: 5,
                      ),
                      _buildImageSelectionButton(4, selectedImage4),
                      Container(
                        height: 20,
                      ),
                      Text("SELECT IMAGE 6"),
                      Container(
                        height: 5,
                      ),
                      _buildImageSelectionButton(5, selectedImage5),
                      Container(
                          margin: EdgeInsets.all(15),
                          child: SubmitButton(
                              buttonText: "CREATE LISTING",
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
