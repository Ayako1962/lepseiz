import 'package:flutter/material.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lepseiz/controllers/main_controller.dart';
import 'package:lepseiz/utils/utils.dart';

class Medicinereminder extends StatefulWidget {
  const Medicinereminder({super.key});

  @override
  State<Medicinereminder> createState() => _MedicinereminderState();
}

class _MedicinereminderState extends State<Medicinereminder> {
  var _medicineReminderController = TextEditingController();
  TimeOfDay? selectedTime;

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
        child: Obx(
       () =>  Column(
            children: MainController.to.medicineReminder.value.entries.map((medicinereminder){
return   Padding(
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
                        "${medicinereminder.value["medicineName"]}",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${medicinereminder.value["reminderTime"]}",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      Icon(
                        Icons.alarm,
                        color: Colors.grey,
                      ),
                    ],
                  ), //FIRST CHILD
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          
                        },
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          MainController.to.selectMedicineReminder(medicinereminder.key);
                          _medicineReminderController.text=medicinereminder.value["medicineName"];
                          var time=medicinereminder.value["reminderTime"].toString().split(":");
                          setState(() {
                            selectedTime=TimeOfDay(hour: int.parse(time[0]), minute:  int.parse(time[1]));
                          });
                          
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.purple,
                        ),
                      ),
                      SizedBox(width: 10,),
                      IconButton(
                        onPressed: () async {
                          await MainController.to.deleteMedicineReminder(medicinereminder.key);
                        },
                        icon: Icon(
                          Icons.remove,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
            
            }).toList()
          )
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
                Expanded(
                    child: Text(selectedTime == null
                        ? "Please select time"
                        : "${selectedTime?.hour.toString()}:${selectedTime?.minute.toString()}")),
                IconButton(
                    onPressed: () async {
                      var time = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                          setState(() {
                            selectedTime=time;
                          });
                    },
                    icon: Icon(Icons.calendar_today))
              ],
            ),
            IconButton(
              onPressed: () async {
                if (_medicineReminderController.text.isEmpty) {
                  Utils.showError("Please fill in the medicine name");
                } else if (selectedTime == null) {
                  Utils.showError("Please indicate time");
                }else{
                  await MainController.to.createMedicineReminder("${selectedTime?.hour.toString()}:${selectedTime?.minute.toString()}", _medicineReminderController.text);
                  Get.back(); 
                }
              },
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
