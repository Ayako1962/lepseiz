import 'package:flutter/material.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/instance_manager.dart';

class Medicinereminder extends StatefulWidget {
  const Medicinereminder({super.key});

  @override
  State<Medicinereminder> createState() => _MedicinereminderState();
}

class _MedicinereminderState extends State<Medicinereminder> {
  var _medicineReminderController = TextEditingController();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(Duration(days: 140)),
        lastDate: DateTime.now(),
        fullCalendar: false,
        accent: Colors.teal,
        padding: 10.0,
        backButton: false,
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
                          icon: const FaIcon(FontAwesomeIcons.capsules,
                              color: Colors.red),
                          onPressed: () {}),
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
                        "7.00p.m",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Icon(
                        Icons.alarm,
                        color: Colors.grey,
                      ),
                    ],
                  ), //FIRST CHILD
                  Column(
                    children: [
                      Icon(
                        Icons.notifications,
                        color: Colors.grey,
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
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.note_alt_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(
                    color: Colors.teal,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                hintText: "add a prescription",
                fillColor: Colors.white70,
              ),
              controller: _medicineReminderController,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(child: Text("${selectedDate==null?"Please select a date":DateTimeFor}")),
                IconButton(onPressed: () {}, icon: Icon(Icons.calendar_today))
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
