import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lepseiz/controllers/auth_controller.dart';
import 'package:lepseiz/screens/profile.dart';

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
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20,),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("images/profilebg.png"),
                radius: 25,
              ),
              title: Text(" Edit Profile"),
              onTap: () {
                Get.to(()=>Profile());
              },
            ),
            ListTile(
              onTap: () async {
                await AuthController.to.signOut();
              },
              title: Text("Logout"),
              leading: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}
