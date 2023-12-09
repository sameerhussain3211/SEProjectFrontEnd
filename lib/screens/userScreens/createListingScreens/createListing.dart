// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// void main() => runApp(MaterialApp(
//       home: Home(),
//       debugShowCheckedModeBanner: false,
//     ));

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {

//   XFile? image;

//   final ImagePicker picker = ImagePicker();

//   //we can upload image from camera or from gallery based on parameter
//   Future getImage(ImageSource media) async {
//     var img = await picker.pickImage(source: media);

//     setState(() {
//       image = img;
//     });
//   }

//   //show popup dialog
//   void myAlert() {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//             title: Text('Please choose media to select'),
//             content: Container(
//               height: MediaQuery.of(context).size.height / 6,
//               child: Column(
//                 children: [
//                   ElevatedButton(
//                     //if user click this button, user can upload image from gallery
//                     onPressed: () {
//                       Navigator.pop(context);
//                       getImage(ImageSource.gallery);
//                     },
//                     child: Row(
//                       children: [
//                         Icon(Icons.image),
//                         Text('From Gallery'),
//                       ],
//                     ),
//                   ),

//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Image'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 myAlert();
//               },
//               child: Text('Upload Photo'),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             //if image not null show the image
//             //if image null show text
//             // image != null
//             //     // ? Padding(
//                 //     padding: const EdgeInsets.symmetric(horizontal: 20),
//                 //     child: ClipRRect(
//                 //       borderRadius: BorderRadius.circular(8),
//                 //       // child: Image.file(
//                 //       //   //to show image, you type like this.
//                 //       //   File(image!.path),
//                 //       //   fit: BoxFit.cover,
//                 //       //   width: MediaQuery.of(context).size.width,
//                 //       //   height: 300,
//                 //       // ),
//                 //     ),
//                 //   )
//                 // : Text(
//                 //     "No Image",
//                 //     style: TextStyle(fontSize: 20),
//                 //   )
//           ],
//         ),
//       ),
//     );
//   }
// }