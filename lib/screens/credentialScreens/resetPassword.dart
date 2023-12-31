import 'package:app7/screens/credentialScreens/loginScreen.dart';
import 'package:app7/widgets/textInput.dart';
import 'package:flutter/material.dart';
import 'package:app7/widgets/SubmitButton.dart';

class resetpassword extends StatelessWidget {
  var PIN = TextEditingController();
  var NewPasssword = TextEditingController();
  var password = TextEditingController();
  var EMAIL = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(80, 208, 52, 41),
          automaticallyImplyLeading: false,
          title: Center(child: Text("BidNest")),
        ),
        // int this lab i did list view , circling image , custom font
        body: Container(
          color: Color.fromARGB(70, 198, 222, 234),
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                margin:
                    EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 40),
                width: (MediaQuery.of(context).size.width) - 50,
                height: 500,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "RESET PASSWORD ",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 10,
                      ),
                      Text("EMAIL"),
                      textInput(
                          controller: EMAIL,
                          hintText: "ENTER EMAIL ADDRESS",
                          borderRadius: 10,
                          obscure: false),
                      Container(
                        height: 5,
                      ),
                      SubmitButton(
                        buttonText: "SUBMIT",
                        buttonLength: 40,
                        onPressedCallback: () {
                          String a = EMAIL.text.toString();
                          print("$a");
                        },
                      ),
                      Container(
                        height: 20,
                      ),
                      Text("PIN CODE"),
                      textInput(
                          controller: PIN,
                          hintText: "ENTER PIN",
                          borderRadius: 10,
                          obscure: false),
                      Container(
                        height: 10,
                      ),
                      Text("NEW PASSWORD"),
                      textInput(
                          controller: NewPasssword,
                          hintText: "ENTER NEW PASSWORD",
                          borderRadius: 10,
                          obscure: true),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: SubmitButton(
                          buttonText: "RESET PASSWORD",
                          buttonLength: 150,
                          onPressedCallback: () {
                            String a = PIN.text.toString();
                            String b = NewPasssword.text.toString();
                            String c = password.text.toString();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginScreen();
                            }));
                            print(
                                "Your pin $a and your new password is $b and confirem password is $c");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
