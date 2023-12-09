import 'package:app7/screens/userScreens/myBidsScreens/approvedBid.dart';
import 'package:app7/screens/userScreens/myBidsScreens/notApprovedbid.dart';
import 'package:app7/screens/userScreens/myBidsScreens/waitingForApproval.dart';
import 'package:app7/widgets/SubmitButton.dart';
import 'package:flutter/material.dart';

class myBidhomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(80, 208, 52, 41),
        title: Center(child: Text("BidNest")),
      ),
      body: Center(
        child: Container(
          color: Color.fromARGB(70, 198, 222, 234),
          child: Column(children: [
            Container(
              height: 40,
            ),
            Container(
              height: 60,
              width: 250,
              color: Color.fromARGB(116, 63, 147, 180),
              child: Text(
                "MY BIDS ",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 50,
            ),
            SubmitButton(
              buttonText: "APPROVED ",
              buttonLength: 250,
              onPressedCallback: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return approvedBids();
                }));
              },
            ),
            Container(
              height: 40,
            ),
            SubmitButton(
              buttonText: "NOT APPROVED ",
              buttonLength: 250,
              onPressedCallback: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return notApprovedBid();
                }));
              },
            ),
            Container(
              height: 40,
            ),
            SubmitButton(
              buttonText: "WAITING FOR APPROVAL ",
              buttonLength: 250,
              onPressedCallback: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return waitingForApproval();
                }));
              },
            )
          ]),
        ),
      ),
    );
  }
}
