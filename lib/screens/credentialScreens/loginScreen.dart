import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app7/screens/credentialScreens/resetPassword.dart';
import 'package:app7/screens/credentialScreens/signUp.dart';
import 'package:app7/screens/userScreens/userHomeScreen.dart';
import 'package:app7/widgets/CustomDropDown.dart';
import 'package:app7/widgets/SubmitButton.dart';
import 'package:app7/widgets/textInput.dart';
import 'package:app7/uitlities/utilities.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  String? dropdownvalue;
  List<String> items = ['Admin', 'User'];

  var emailAddress = TextEditingController();
  var password = TextEditingController();
  String? errorMessage;

 Future<void> _login() async {
  String apiUrl = 'http://localhost:3000/user/login';

  // Capture the current context
  BuildContext currentContext = context;

  try {
    var url = Uri.parse(apiUrl);
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': emailAddress.text,
        'password': password.text,
      }),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      // Save credentials to shared preferences

      // Successful login, navigate to home screen
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final String? token = responseData['token'];
      JWT = token;
      saveCredentials(emailAddress.text, password.text, token);


      // Use the captured context
      if (token != null && token.isNotEmpty) {
        // Only navigate if the authentication is successful
        Navigator.pushReplacement(
          currentContext,
          MaterialPageRoute(builder: (context) => userHomeScreen()),
        );
      } else {
        // Handle authentication failure
        setState(() {
          errorMessage = 'Authentication failed';
        });
      }
    } else {
      // Incorrect email or password, show an error message
      setState(() {
        errorMessage = 'Invalid email or password';
      });
    }
  } catch (error) {
    print('Error: $error');
    // Handle error accordingly
    setState(() {
      errorMessage = 'Error during login';
    });
  }
}

// Function to save credentials to shared preferences
Future<void> saveCredentials(String emailAddress, String password, String? jwt) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('emailAddress', emailAddress);
  prefs.setString('password', password);
  prefs.setString('token', jwt ?? "");

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
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.all(100),
              width: (MediaQuery.of(context).size.width) - 50,
              height: 500,
              child: ListView(
                children: [
                  CustomDropdown(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    items: items,
                    hint: "Login As",
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownvalue = newValue;
                      });
                    },
                  ),
                  Text(
                    "LOGIN PAGE",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Container(height: 50),
                  Text("EMAIL"),
                  textInput(
                    controller: emailAddress,
                    hintText: "ENTER USER EMAIL",
                    borderRadius: 10,
                    obscure: false,
                  ),
                  Container(height: 30),
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
                      buttonText: "LOGIN",
                      buttonLength: 150,
                      onPressedCallback: () {
                        String u = emailAddress.text.toString();
                        String p = password.text.toString();
                        String d = dropdownvalue.toString();
                        print("username $u password $p you are $d");
                        _login();
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return resetpassword();
                      }));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Reset Password",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text("No Account "),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return signUp();
                            }));
                          },
                          child: Container(
                            child: Text(
                              "Create one",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (errorMessage != null)
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        errorMessage!,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
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
