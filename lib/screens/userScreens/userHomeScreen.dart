import 'package:app7/screens/credentialScreens/loginScreen.dart';
import 'package:app7/screens/userScreens/createListingScreens/createListing.dart';
import 'package:app7/screens/userScreens/myBidsScreens/myBidHomepage.dart';
import 'package:app7/screens/userScreens/searchScreens/search.dart';
import 'package:app7/screens/userScreens/viewListingsScreens/viewLists.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class userHomeScreen extends StatelessWidget {
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
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(72, 33, 243,
                      198), // Change the color to your desired color
                  borderRadius:
                      BorderRadius.circular(30), // Adjust the radius as needed
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return search();
                    }));
                  },
                  child: Container(
                    child: FaIcon(
                      FontAwesomeIcons.search,
                      size: 100,
                    ),
                  ),
                ),
              ),
              Text(
                "SEARCH FOR HOUSES",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(72, 33, 243,
                      198), // Change the color to your desired color
                  borderRadius:
                      BorderRadius.circular(30), // Adjust the radius as needed
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return myBidhomepage();
                    }));
                  },
                  child: Container(
                    child: FaIcon(
                      FontAwesomeIcons.list,
                      size: 100,
                    ),
                  ),
                ),
              ),
              Text(
                "MY BIDS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(72, 33, 243,
                      198), // Change the color to your desired color
                  borderRadius:
                      BorderRadius.circular(30), // Adjust the radius as needed
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return createListingScreen();
                    }));
                  },
                  child: Container(
                    child: FaIcon(
                      FontAwesomeIcons.handHolding,
                      size: 100,
                    ),
                  ),
                ),
              ),
              Text(
                "CREATE A LISTING",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(72, 33, 243,
                      198), // Change the color to your desired color
                  borderRadius:
                      BorderRadius.circular(30), // Adjust the radius as needed
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return viewList();
                    }));
                  },
                  child: Container(
                    child: FaIcon(
                      FontAwesomeIcons.bars,
                      size: 100,
                    ),
                  ),
                ),
              ),
              Text(
                "MY LISTING",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                height: 30,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(72, 33, 243,
                      198), // Change the color to your desired color
                  borderRadius:
                      BorderRadius.circular(30), // Adjust the radius as needed
                ),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    },
                    child: FaIcon(FontAwesomeIcons.signOut),
                  ),
                ),
              ),
              Text(
                "LOG OUT",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
