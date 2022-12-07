import 'package:flutter/material.dart';

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
              ListTile(title: Text("-Ease the person to the floor"),),
                ListTile(title: Text("-Turn the person gently onto one side"),),
                  ListTile(title: Text("-Clear the area around the person to prevent any injury"),),
                    ListTile(title: Text("-Put something soft and flat under his or her head"),),
                      ListTile(title: Text("-Remove eye glasses"),),
                        ListTile(title: Text("-Loosen tie or anything around the neck that could prevent them from breathing well"),),
                        
               ListTile(title: Text("DO NOT"),leading: Icon(Icons.do_disturb_alt),),
               ListTile(title: Text("-Do not put anything in the person's mouth"),),
               ListTile(title: Text("-Do not hold the person down or try to stop his or her movements"),),
               ListTile(title: Text("-Do not try to give mouth to mouth breaths"),),
               ListTile(title: Text("-Do not offer the person water or food until she or he is fully alert"),),
            ],
          ),
          
          
        ),
    );
  }
}