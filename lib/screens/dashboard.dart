import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lepseiz/screens/first_aid.dart';
import 'package:lepseiz/screens/lepsydiary.dart';
import 'package:lepseiz/screens/logout.dart';
import 'package:lepseiz/screens/medicine_reminder.dart';
import 'package:lepseiz/screens/passwords.dart';
import 'package:lepseiz/screens/popmenu.dart';
import 'package:lepseiz/screens/profile.dart';

import 'package:lepseiz/screens/setting.dart';
import 'package:lepseiz/screens/track_record.dart';



class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("HOME"),
        backgroundColor: Colors.teal,
        actions: [
         PopupMenuButton(

onSelected: (result) {
            
               if (result == 0) {
                Get.to(() => Settings());
              } else if(result == 1) {
                Get.to(() => (Logout()));
              }else if(result == 2) {
                Get.to(() => (Passwords()));
              }else if(result == 3) {
                Get.to(() => (Profile()));
              }
            },
  icon: Icon(Icons.more_vert),
  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
    
    const PopupMenuItem(
    value: 0,
      child: ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
      ),
    ),
    
    const PopupMenuItem(
      value: 1,
      child: ListTile(
        leading: Icon(Icons.logout),
        title: Text('Logout'),
      ),
    ),
    const PopupMenuItem(
      value: 2,
      child: ListTile(
        leading: Icon(Icons.password),
        title: Text('Passwords'),
      ),
    ),

    const PopupMenuDivider(),
    const PopupMenuItem(
      value: 3,
      child: ListTile(
        leading:CircleAvatar(),
        title: Text('Profile'),
      ),
    ),
   
    
  ],
   
),
        ],       
          ),
      
      
      body: SingleChildScrollView(
        child: Column(
          children: [
      //FIRST ROW
     
     Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   //FIRST CARD

                   InkWell(
                    onTap: () => Get.to(()=> Lepsydiary()),
                     child: Container(
                      width: Get.width * 0.4,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 204, 204, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(7),
                        ),
                      ),
                      child: Column(
                        children: [
                          //IMAGE
                          Image(
                            image: AssetImage("images/toolkitbg.png"),
                            width: Get.width * 0.39,
                            height: Get.width * 0.39,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Lepsydiary",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                        ],
                      ),
                                     ),
                   ),
                  //SECOND CARD
                  InkWell(
                    onTap: () => Get.to(()=> Firstaid()),
                    child: Container(
                      width: Get.width * 0.4,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(153, 204, 255, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(7),
                        ),
                      ),
                      child: Column(
                        children: [
                          //IMAGE
                          Image(
                            image: AssetImage("images/firstaidbg1.png"),
                            width: Get.width * 0.39,
                            height: Get.width * 0.39,
                            fit: BoxFit.cover,
                            
                          ),
                          
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Firstaid",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                        ],
                      ),
                    
                    ),
                  ),
                ],
              ),
            ),
              //THIS IS SECOND ROW
          
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    //THIRD CARD

                   InkWell(
                    onTap: () => Get.to(()=> Medicinereminder()),
                     child: Container(
                      width: Get.width * 0.4,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(224, 224, 224, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(7),
                        ),
                      ),
                      child: Column(
                        children: [
                          //IMAGE
                          Image(
                            image: AssetImage("images/pillsbg.png"),
                            width: Get.width * 0.39,
                            height: Get.width * 0.39,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Medicine Reminder",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                        ],
                      ),
                                     ),
                   ),
                  //FORTH CARD
                  InkWell(
                    onTap: () => Get.to(()=> Trackrecord()),
                    child: Container(
                      width: Get.width * 0.4,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 204, 229, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(7),
                        ),
                      ),
                      child: Column(
                        children: [
                          //IMAGE
                          Image(
                            image: AssetImage("images/trackbg1.png"),
                            width: Get.width * 0.39,
                            height: Get.width * 0.39,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Track Record",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //THIS IS THE THIRD ROW
            //FIFTH CARD
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Container(
                    width: Get.width *0.4,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(192, 192, 192, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(7),
                      ),
                    ),
                    child: Column(
                      children: [
                        //IMAGE
                        Image(
                          image: AssetImage("images/bookingbg.png"),
                          width: Get.width * 0.39,
                          height: Get.width * 0.39,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Book Session",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                      ],
                    ),
                  ),
                  //SIXTH CARD
                  Container(
                    width: Get.width * 0.4,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(160, 204, 160, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(7),
                      ),
                    ),
                    child: Column(
                      children: [
                        //IMAGE
                        Image(
                          image: AssetImage("images/buybg.png"),
                          width: Get.width * 0.39,
                          height: Get.width * 0.39,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Buy Medicine",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                      ],
                    ),
                  
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
        );
  }
}
