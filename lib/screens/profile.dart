import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text(
            "Profile",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 85,
                    backgroundImage: AssetImage(
                      'INSERT_URL_HERE',
                    ),
                    backgroundColor: Colors.teal,
                    
                  ),
                ),
                Positioned(child: Container(width: 40,height: 40,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white70 ),
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.teal,
                        size: 30.0,
                      ),
                    ),bottom: 10,right: 20,)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                hintText: "Name",
                fillColor: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
