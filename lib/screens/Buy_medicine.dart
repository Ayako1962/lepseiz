import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class buyMedicine extends StatelessWidget {
  const buyMedicine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text(
            "my Cart",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //FIRST CHILD
                Column(
                  children: [
                    IconButton(
        icon: const FaIcon(FontAwesomeIcons.tablets,color: Colors.yellow),
        onPressed: () {}
),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                 ),
              //SECOND CHILD
                Column(
                  children: [
                   
                    Text(
                      "Phenytoin",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "sh. 1450.00",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),

                  ],
                ), //FIRST CHILD
                Column(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.pink,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  
                  ],
                ),
              ],
            ),
          ),
          //SPACE
          SizedBox(
            height: 20,
          ),
          
          ],
          
        ),
       
      ),
       //FAB LOCATION
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //BOTTOM NAVBAR WITH FAB
      bottomNavigationBar: BottomAppBar(
        color: Colors.teal,
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.payment_outlined, color: Colors.white,),
              
            ),
          ],
        ),
      ),    
    );
  }
}
  
