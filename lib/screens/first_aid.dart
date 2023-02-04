import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Firstaid extends StatelessWidget {
  const Firstaid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text(
            "Seizure First Aid",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
        ),
        ),
        body: SingleChildScrollView(
          
          child: Column(
            children: <Widget>[
              Container(
              width: Get.width,
              height: Get.height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/faidbg.png"),
                  fit: BoxFit.fill,
                ),
              
              ),
            ),
              ListTile(title: Text("1). Ease the person to the floor"), textColor: Colors.teal),
                ListTile(title: Text("2). Turn the person gently onto one side"), textColor: Colors.teal),
                  ListTile(title: Text("3). Clear the area around the person to prevent any injury"), textColor: Colors.teal),
                    ListTile(title: Text("4). Put something soft and flat under his or her head"), textColor: Colors.teal),
                      ListTile(title: Text("5). Remove eye glasses"), textColor: Colors.teal),
                        ListTile(title: Text("6). Loosen tie or anything around the neck that could prevent them from breathing well"), textColor: Colors.teal),
                         ListTile(title: Text("7). loosen neckware"), textColor: Colors.teal),
 ListTile(title: Text("8). look for a medical ID tag"), textColor: Colors.teal),
 ListTile(title: Text("9). stay back if the person appears angry or aggressive"), textColor: Colors.teal),
 ListTile(title: Text("10).STAY CALM"), textColor: Colors.teal),



               ListTile(title: Text("DO NOT"),leading: Icon(Icons.do_disturb_alt), textColor: Colors.black),
               ListTile(title: Text("-Do not put anything in the person's mouth"),textColor: Colors.red),
               ListTile(title: Text("-Do not hold the person down or try to stop his or her movements"),textColor: Colors.red),
               ListTile(title: Text("-Do not try to give mouth to mouth breaths"),textColor: Colors.red),
               ListTile(title: Text("-Do not offer the person water or food until she or he is fully alert"),textColor: Colors.red),
            ],
          ),
          
          
        ),
    );
  }
}