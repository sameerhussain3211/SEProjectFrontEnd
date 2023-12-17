import 'package:flutter/material.dart';
import 'package:app7/screens/credentialScreens/loginScreen.dart';
import 'package:app7/screens/userScreens/userHomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app7/uitlities/utilities.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        // Check shared preferences for saved credentials
        future: checkCredentials(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If credentials are present, navigate to userHomeScreen
            return snapshot.data == true ? userHomeScreen() : LoginScreen();
          } else {
            // Show loading indicator or splash screen while checking credentials
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

// Function to check shared preferences for saved credentials
Future<bool> checkCredentials() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? emailAddress = prefs.getString('emailAddress');
  String? password = prefs.getString('password');
  String? token = prefs.getString('token');

  JWT = token;


  print('Email Address: $emailAddress');
  print('Password: $password');
  print('token: $token');


  // Check if both username and password are present
  return emailAddress != null && password != null;
}

}
