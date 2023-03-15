import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lepseiz/screens/dashboard.dart';
import 'package:lepseiz/screens/welcomepage.dart';

class Sessions extends StatelessWidget {
  const Sessions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Center(
          child: Text(
            "Meet your favourite specialist",
            style: TextStyle(
                color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
      body: Container(
        
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ///IMAGE
            Container(
              width: Get.width,
              height: Get.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/doktaribg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //NAME

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
                fillColor: Colors.white70,
              ),
              //controller: _nameController,
            ),
            //CONTACT NO.
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.call),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  hintText: "Phone.",
                  fillColor: Colors.white70),
              // controller: _phoneController,
            ),

            //EMAIL

            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.note_add_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                hintText: "Reason for meeting the doctor",
                fillColor: Colors.white70,
              ),
              // controller: _emailController,
            ),

// PASSSWORD
          SizedBox(
              height: 20,
              child: TextField(
       // controller: dateController, //editing controller of this TextField
          decoration: const InputDecoration( 
                    icon: Icon(Icons.calendar_today), //icon of text field
                   labelText: "Enter Date" //label text of field
            ),
           readOnly: true,  // when true user cannot edit text 
           onTap: () async {
                  //when click we have to show the datepicker
            }
  )
            ),
            Container(
              width: Get.width,
              height: 45,
              child: TextButton(
                onPressed: () {
                  //Get.to(() => Dashboard());
                  showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Messege Sent'),
          
          actions: <Widget>[
            
            TextButton(
              onPressed: () =>Get.to(() => Dashboard()),
              child: const Text('Okay'),
            ),
          ],
        ),
      );
                },
                child: Text(
                  "Book Appointment",
                  style: TextStyle(
                      fontSize: 15,
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
