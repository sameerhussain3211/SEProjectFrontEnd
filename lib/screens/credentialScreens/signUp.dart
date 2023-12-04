import 'package:app7/screens/credentialScreens/loginScreen.dart';
import 'package:flutter/material.dart';

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
            
                  
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "EMAIL ADDRESS",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                           
                            width: 2
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color.fromARGB(251, 97, 233, 101),
                            width: 2
                          )
                        )
                      ),
                    ),
            
          
                  Container(height: 20,),
                  Text("PASSWORD"),
            
                  
                    TextField(
                      controller: passsword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "CREATE A PASSWORD",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                           
                            width: 2
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color.fromARGB(251, 97, 233, 101),
                            width: 2
                          )
                        )
                      ),
                    ),
            
            
                  
                 Container(
                    margin: EdgeInsets.all(15),
                    child: ElevatedButton(
                      
                       style: ElevatedButton.styleFrom(
                       primary: Colors.green,
                        onPrimary: Colors.white,
                         shadowColor: Colors.greenAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(32.0)),
                         minimumSize: Size(150, 50), //////// HERE
            ),
                    
                      onPressed:(){ 
                        String a = email.text.toString();
                        String b= passsword.text.toString();
                         Navigator.push(context, MaterialPageRoute(builder: (context){return LoginScreen();
                }
                )
                );
                     
                         print("Your email $a and your new password is $b ");},
                     child: Text("SIGN UP"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
     

    );
  }

}