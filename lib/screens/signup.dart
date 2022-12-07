
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lepseiz/controllers/auth_controller.dart';

import 'package:lepseiz/screens/dashboard.dart';
import 'package:lepseiz/screens/login.dart';
import 'package:lepseiz/utils/utils.dart';
import 'package:get/get.dart';

import 'signup.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text(
            "lepsyHub",
            style: TextStyle(
                color: Colors.white,
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
          ///IMAGE
            Container(
              width: Get.width,
              height: Get.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/signup.jpg"),
                  fit: BoxFit.fill,
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
      hintStyle: TextStyle(color: Colors.grey[800], fontSize: 15, fontWeight: FontWeight.bold),
      hintText: "Name",
      fillColor: Colors.white70,

      ),
            controller: _nameController, 
),
    //CONTACT NO.
               TextFormField(
  decoration: InputDecoration(
     prefixIcon: Icon(Icons.call),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      hintStyle: TextStyle(color: Colors.grey[800],fontSize: 15, fontWeight: FontWeight.bold),
      hintText: "Phone.",
      fillColor: Colors.white70),
      controller: _phoneController,
),
              

            //EMAIL
            
           TextFormField(
  decoration: InputDecoration(
    prefixIcon: Icon(Icons.email),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      hintStyle: TextStyle(color: Colors.grey[800], fontSize: 15, fontWeight: FontWeight.bold),
      hintText: "E-mail",
      fillColor: Colors.white70,
      ),
       controller: _emailController,
),

          
// PASSSWORD
  TextFormField(
  decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      hintStyle: TextStyle(color: Colors.grey[800],fontSize: 15, fontWeight: FontWeight.bold),
      hintText: " Password",
      fillColor: Colors.white70),
       controller: _passwordController,
              obscureText: true,
),
              

                ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              onPressed: () async {
                if (_emailController.text.trim().isEmpty ||
                    !_emailController.text.trim().isEmail) {
                  Utils.showError("Please Enter valid email!");
                } else if (_passwordController.text.trim().isEmpty ||
                    _nameController.text.trim().isEmpty ||
                    _phoneController.text.trim().isEmpty) {
                  Utils.showError("No field should be empty!");
                } else {
                  AuthController.to.register(
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                      _nameController.text.trim(),
                      _phoneController.text.trim());
                }
              },
              child: const Text("Sign Up"),),
                

             SizedBox(
              height: 20,
            ),
            Text.rich(
                // ignore: prefer_const_literals_to_create_immutables
                TextSpan(
                    text: 'Already have an account? ',
                    children: <InlineSpan>[
                  TextSpan(
                      text: 'Login',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => Login());
                        })
                    ],
            ),
            ),
                
         ],
        ),
      ),
        );
      

  }
}