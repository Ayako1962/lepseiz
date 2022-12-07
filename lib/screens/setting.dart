
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text(
            "Settings",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(leading: CircleAvatar(
              backgroundImage: AssetImage("images/profilebg.png"),
              radius: 25,),
              title: Text(" Edit Profile"),),
            
            ListTile(title: Text("Logout"),leading: Icon(Icons.logout),),
             ListTile(title: Text("Change Password"),leading: Icon(Icons.password),),
             ListTile(title: Text("Contact Us"),leading: Icon(Icons.call),),
            

          ],
        ),

      ),
    );
  }
}