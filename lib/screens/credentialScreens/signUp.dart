import 'package:app7/screens/credentialScreens/loginScreen.dart';
import 'package:app7/widgets/textInput.dart';
import 'package:flutter/material.dart';
import 'package:app7/widgets/SubmitButton.dart';

class signUp extends StatelessWidget{

  var email=TextEditingController();
   var passsword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(80, 208, 52, 41),

        
        title: Center(child: Text("BidNest")),
        
      ),
      // int this lab i did list view , circling image , custom font
      body:
      Container(
        color: Color.fromARGB(70, 198, 222, 234),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
             margin: EdgeInsets.all(100),
             width: (MediaQuery. of(context). size. width)-50,
              height: 500,
              
              child: Column(
                children: [
                  
                  Text("WELCOME TO BIDNEST ", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),),


                  Container(height: 20,),
                  Text("EMAIL ADDRESS"),
            

                    textInput(controller: email,
                     hintText: "EMAIL ADDRESS",
                      borderRadius: 10, 
                      obscure: false),
            
          
                  Container(height: 20,),
                  Text("PASSWORD"),
            
                    textInput(controller: passsword,
                     hintText: "EMAIL PASSWORD",
                      borderRadius: 10, 
                      obscure: true),

            Container(
                  margin: EdgeInsets.all(15),
                   child: SubmitButton(buttonText: "SIGN UP", buttonLength: 150,
                   onPressedCallback: (){
                        String a = email.text.toString();
                        String b= passsword.text.toString();

                    Navigator.push(context, MaterialPageRoute(builder: (context){return LoginScreen();

                    }   ));
                    print("Your pin $a and your new password is $b ");
                   },
                   ),
                 )
                    ,
                ],
              ),
            ),
          ),
        ),
      )
     

    );
  }

}