import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "HOME",
            style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //this is the row
            Container(
              width: Get.width,
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //this is the first card
                  InkWell(
                    onTap: () {
                      
                    },
                    child: Container(
                      width: Get.width * 0.4,
                      height: Get.width * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.4),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          //add image 
                          //sizedbox
                          //text
                  
                        ],
                      ),
                    ),
                  ),
  Container(
                    width: Get.width * 0.4,
                    height: Get.width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.4),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(20)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
