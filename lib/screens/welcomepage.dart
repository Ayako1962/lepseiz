import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lepseiz/screens/login.dart';

class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     
      body: Container(
         decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/doc.png"),
                  fit: BoxFit.fill,
                ),
              ),
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //TITLE AND SUBTITLE TEXT
        Column(
          children: [
              Text(
              "Welcome to lepsyHub",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              "We know how it feels to be epileptic",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
          ],
        ),

            //THE IMAGE
           
            //BUTTON
            Container(
              width: Get.width,
              height: 45,
              child: TextButton(
                onPressed: () {
                  Get.to(()=> Login());
                },
                child: Text(
                  "Proceed",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.teal),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}