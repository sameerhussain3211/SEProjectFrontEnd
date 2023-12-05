import 'package:app7/homescreen1.dart';
import 'package:app7/screens/userScreens/searchScreens/search.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class userHomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(80, 208, 52, 41),
        automaticallyImplyLeading: false,
        title: Center(child: Text("BidNest")),
      ),
    
      body:
      Center(
        child: Column(
         
          children: [
            InkWell(
                onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context){return search();}));},
               
              child: Container(
                child: FaIcon(FontAwesomeIcons.search, size: 100,),
              ),
            ),
            Text("SEARCH FOR HOUSES", style: TextStyle(fontWeight: FontWeight.bold),),

            Container(height: 20,),

            InkWell(
               onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context){return homescreen1();}));},
               
              child: Container(
                child: FaIcon(FontAwesomeIcons.list, size: 100,),
              ),
            ),

             Text("MY BIDS" , style: TextStyle(fontWeight: FontWeight.bold),
             ),



            Container(height: 20,),

            InkWell(
               onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context){return homescreen1();}));},
               
              child: Container(
                child: FaIcon(FontAwesomeIcons.handHolding, size: 100,),
              ),
            ),
             Text("CREATE A LISTING", style: TextStyle(fontWeight: FontWeight.bold),),

            Container(height: 20,),

            InkWell(
               onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context){return homescreen1();}));},
               
              child: Container(
                child: FaIcon(FontAwesomeIcons.bars, size: 100,),
              ),
            ),
             Text("MY LISTING", style: TextStyle(fontWeight: FontWeight.bold),),

            Container(height: 20,),

          ],
        ),
      )
      

    );
  }

}