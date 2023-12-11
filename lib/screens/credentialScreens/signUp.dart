import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app7/screens/credentialScreens/loginScreen.dart';
import 'package:app7/widgets/textInput.dart';
import 'package:app7/widgets/SubmitButton.dart';

class signUp extends StatelessWidget {
  var email = TextEditingController();
  var password = TextEditingController();
  var fullName = TextEditingController();
  var userName = TextEditingController();
  var phoneNumber = TextEditingController();

  Future<void> registerUser(BuildContext context) async {
    String apiUrl = 'http://localhost:3000/user/register';

    try {
      var url = Uri.parse(apiUrl);
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email.text,
          'password': password.text,
          'name': fullName.text,
          'username': userName.text,
          'contact': phoneNumber.text,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Registration successful, navigate to login screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      } else {
        // Handle registration failure
        // You might want to show an error message to the user
        print('Registration failed');
      }
    } catch (error) {
      print('Error: $error');
      // Handle error accordingly
      // You might want to show an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(80, 208, 52, 41),
        automaticallyImplyLeading: false,
        title: Center(child: Text("BidNest")),
      ),
      body: Container(
        color: Color.fromARGB(70, 198, 222, 234),
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 40),
            width: (MediaQuery.of(context).size.width) - 50,
            height: 500,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "WELCOME TO BIDNEST ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 20,
                  ),
                  Text("FULL NAME"),
                  textInput(
                    controller: fullName,
                    hintText: "ENTER YOUR NAME",
                    borderRadius: 10,
                    obscure: false,
                  ),
                  Container(
                    height: 20,
                  ),
                  Text("USER NAME"),
                  textInput(
                    controller: userName,
                    hintText: "ENTER USER NAME",
                    borderRadius: 10,
                    obscure: false,
                  ),
                  Container(
                    height: 20,
                  ),
                  Text("EMAIL ADDRESS"),
                  textInput(
                    controller: email,
                    hintText: "EMAIL ADDRESS",
                    borderRadius: 10,
                    obscure: false,
                  ),
                  Container(
                    height: 20,
                  ),
                  Text("MOBILE NUMBER"),
                  textInput(
                    controller: phoneNumber,
                    hintText: "ENTER MOBILE NUMBER",
                    borderRadius: 10,
                    obscure: false,
                  ),
                  Container(
                    height: 20,
                  ),
                  Text("PASSWORD"),
                  textInput(
                    controller: password,
                    hintText: "ENTER PASSWORD",
                    borderRadius: 10,
                    obscure: true,
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: SubmitButton(
                      buttonText: "SIGN UP",
                      buttonLength: 150,
                      onPressedCallback: () {
                        // Call the registerUser function to connect with the backend
                        registerUser(context);
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
