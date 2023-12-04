import 'package:app7/homescreen1.dart';
import 'package:app7/screens/credentialScreens/resetPassword.dart';
import 'package:app7/screens/credentialScreens/signUp.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
    String ?dropdownvalue;
  List<String> items=['Admin','User'];

  var email=TextEditingController();
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
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                         border: Border.all(color: Color.fromARGB(81, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(10),

  ),
                    width: (MediaQuery. of(context). size. width) ,
                   
                    child: DropdownButton( 
                                  // Initial Value 
                                  value: dropdownvalue, 
                                  // Down Arrow Icon 
                                  icon: const Icon(Icons.keyboard_arrow_down), 
                                  // Array list of items 
                                  items: items.map((String items) { 
                                    return DropdownMenuItem( 
                                        value: items, 
                                      child: Text(items), 
                                    ); 
                                  }).toList(), 
                                  // After selecting the desired option,it will 
                                  // change button value to selected value 
                                  onChanged: (String? newValue) {  
                                    setState(() { 
                                  dropdownvalue = newValue!; 
                                    }); 
                                  }, 
                                  hint: Text("Login As"),
                                ),
                  ), 
                  Text("LOGIN PAGE", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),),
          
                  Container(height: 50,),
                  Text("Email"),
            
                  
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "Enter Email",
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
            
            
                  Container(height: 50,),
                  Text("PASSWORD"),
                  
                  TextField(
                    // keyboardType: TextInputType.number, can change key bord from here
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
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
                        String b= password.text.toString();
                     
                         print("Your email $a and your new password is $b ");
                          Navigator.push(context, MaterialPageRoute(builder: (context){return homescreen1();
                }
                )
                );},
                     child: Text("LOGIN"),
                    ),
                  ),



                  InkWell(
                    onTap: (){
                  print(".............reset");
                   Navigator.push(context, MaterialPageRoute(builder: (context){return resetpassword();
                }
                )
                );
                  
                },
               
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text("Reset Password", style: TextStyle(color: Colors.blue,
                      decoration: TextDecoration.underline,)),
                    ),
                  ),
                  

                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text("No Account "),
                          InkWell(
                            onTap: (){
                  print(".....................create");
                   Navigator.push(context, MaterialPageRoute(builder: (context){return signUp();
                }
                )
                );
                },
               child: Container(child: Text("Create one",  style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline,)
               )
               ))
                        ],
                      )
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
