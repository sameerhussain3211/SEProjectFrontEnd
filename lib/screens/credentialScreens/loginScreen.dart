import 'package:app7/screens/credentialScreens/resetPassword.dart';
import 'package:app7/screens/credentialScreens/signUp.dart';
import 'package:app7/screens/userScreens/userHomeScreen.dart';
import 'package:app7/widgets/CustomDropDown.dart';
import 'package:app7/widgets/SubmitButton.dart';
import 'package:app7/widgets/textInput.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(70, 198, 222, 234),
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
                //  margin: EdgeInsets.all(60),
                margin:
                    EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 50),
                width: (MediaQuery.of(context).size.width) - 50,
                height: 500,

                child: Column(
                  children: [
                    // Example usage:
                    CustomDropdown(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      items: items,
                      hint: "Login As",
                      onChanged: (String newValue) {
                        dropdownvalue =
                            newValue; // Handle the updated value here
                      },
                    ),

                    Text(
                      "LOGIN PAGE",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),

                    Container(
                      height: 40,
                    ),
                    Text("EMAIL ADDRESS"),

                    textInput(
                        controller: emailAddress,
                        hintText: "ENTER EMAIL ADDRESS",
                        borderRadius: 10,
                        obscure: false),

                    Container(
                      height: 30,
                    ),
                    Text("PASSWORD"),

                    textInput(
                        controller: password,
                        hintText: "ENTER PASSWORD",
                        borderRadius: 10,
                        obscure: true),

                    Container(
                      margin: EdgeInsets.all(15),
                      child: SubmitButton(
                        buttonText: "LOGIN",
                        buttonLength: 150,
                        onPressedCallback: () {
                          String b = emailAddress.text.toString();
                          String c = password.text.toString();
                          String d = dropdownvalue.toString();
                          print("USERNAME $b password $c your are $d");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return userHomeScreen();
                          }));
                        },
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        print(".............reset");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return resetpassword();
                        }));
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Text("Reset Password",
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            )),
                      ),
                    ),

                    Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text("No Account "),
                            InkWell(
                                onTap: () {
                                  print(".....................create");
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return signUp();
                                  }));
                                },
                                child: Container(
                                    child: Text("Create one",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                        ))))
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
