import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lepseiz/screens/dashboard.dart';
import 'package:lepseiz/screens/setting.dart';

class Passwords extends StatelessWidget {
  const Passwords({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text(
            "Change Password",
            style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                fontSize: 30),
                
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children:[
         
            //old password
            
           TextFormField(
  decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      hintStyle: TextStyle(color: Colors.grey[800], fontSize: 15, fontWeight: FontWeight.bold),
      hintText: "Old Password",
      fillColor: Colors.white70,
      ),
      
      
),

              // NEW PASSWORD
               TextFormField(
  decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      hintStyle: TextStyle(color: Colors.grey[800],fontSize: 15, fontWeight: FontWeight.bold),
      hintText: "New Password",
      fillColor: Colors.white70),
),
              
//CONFIRM PASSSWORD
  TextFormField(
  decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      hintStyle: TextStyle(color: Colors.grey[800],fontSize: 15, fontWeight: FontWeight.bold),
      hintText: " Confirm Password",
      fillColor: Colors.white70),
),
              

              //BUTTON 1
            Container(
                
              width: Get.width,
              height: 45,
              child: TextButton(
                onPressed: () {
                  Get.to(() => Dashboard());
                },
                child: Text(
                  "Submit New Password",
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
            ),
         ],
        ),
      ),
    );
  }
}