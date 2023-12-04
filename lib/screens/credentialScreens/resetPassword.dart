import 'package:app7/screens/credentialScreens/loginScreen.dart';
import 'package:flutter/material.dart';

class resetpassword extends StatelessWidget{

  var PIN=TextEditingController();
   var NewPasssword=TextEditingController();
  var password=TextEditingController();
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
                  
                  Text("RESET PASSWORD ", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),),


                  Container(height: 20,),
                  Text("PIN CODE"),
            
                  
                    TextField(
                      controller: PIN,
                      decoration: InputDecoration(
                        hintText: "Enter PIN",
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
                  Text("NEW PASSWORD"),
            
                  
                    TextField(
                      controller: NewPasssword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "NEW PASSWORD",
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
                  Text("CONFIRM PASSWORD"),
                  
                  TextField(
                    // keyboardType: TextInputType.number, can change key bord from here
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "CONFIRM PASSWORD ",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2
                          ),
                          ),
                          // enabledBorder: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(20),
                          // borderSide: BorderSide(
                          //   color: Colors.blue,
                          //   width: 2
                          // ),
                          // ),
                        
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
                        String a = PIN.text.toString();
                        String b= NewPasssword.text.toString();
                         String c = password.text.toString();
                          Navigator.push(context, MaterialPageRoute(builder: (context){return LoginScreen();
                }
                )
                );
                         print("Your pin $a and your new password is $b and confirem password is $c");},
                     child: Text("SUBMIT"),
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