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
        firstDate: DateTime.now().subtract(const Duration(days: 140)),
        lastDate: DateTime.now(),
        fullCalendar: false,
        accent: Colors.teal,
        padding: 10.0,
        backButton: false,
      ),
      body: SingleChildScrollView(
        child: Obx(() => Column(
                children: MainController.to.medicineReminder.value.entries
                    .map((medicinereminder) {
              return Padding(
                padding: const EdgeInsets.all(20),
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
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    //SECOND CHILD
                    Column(
                      children: [
                        Text(
                          "${medicinereminder.value["medicineName"]}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${medicinereminder.value["reminderTime"]}",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                        const Icon(
                          Icons.alarm,
                          color: Colors.grey,
                        ),
                      ],
                    ), //FIRST CHILD
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () {
                            MainController.to
                                .selectMedicineReminder(medicinereminder.key);
                            _medicineReminderController.text =
                                medicinereminder.value["medicineName"];
                            var time = medicinereminder.value["reminderTime"]
                                .toString()
                                .split(":");
                            setState(() {
                              selectedTime = TimeOfDay(
                                  hour: int.parse(time[0]),
                                  minute: int.parse(time[1]));
                            });
                            showEditDialogue();
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.purple,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () async {
                            await MainController.to
                                .deleteMedicineReminder(medicinereminder.key);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList())),
      ),
      //FAB LOCATION
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //BOTTOM NAVBAR WITH FAB
      bottomNavigationBar: BottomAppBar(
        color: Colors.teal,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () async {
                showEditDialogue();
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  showEditDialogue() {
    showDialog(
        context: context,
        builder: (context) {
          var selectedTime2=selectedTime;
          return StatefulBuilder(
            builder: (context,setState) {
              return SimpleDialog(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                title: const Text('MedicineReminder'),
                children: [
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.note_alt_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: const TextStyle(
                          color: Colors.teal,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      hintText: "add medicine",
                      fillColor: Colors.white70,
                    ),
                    controller: _medicineReminderController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(selectedTime2 == null
                              ? "Please select time"
                              : "${selectedTime2?.hour.toString()}:${selectedTime2?.minute.toString()}")),
                      IconButton(
                          onPressed: () async {
                            var time = await showTimePicker(
                                context: context, initialTime: TimeOfDay.now());
                            setState(() {
                              selectedTime = time;
                              selectedTime2 = time;
                            });
                          },
                          icon: const Icon(Icons.calendar_today))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50)),
                    onPressed: () async {
                      if (_medicineReminderController.text.isEmpty) {
                        Utils.showError("Please fill in the medicine name");
                      } else if (selectedTime == null) {
                        Utils.showError("Please indicate time");
                      } else {
                      if(MainController.to.medicineReminderSelectedId.value.isEmpty){
                       await MainController.to.createMedicineReminder(
                            "${selectedTime?.hour.toString()}:${selectedTime?.minute.toString()}",
                            _medicineReminderController.text);
                      }else{
                          await MainController.to.updateMedicineReminder(
                            "${selectedTime?.hour.toString()}:${selectedTime?.minute.toString()}",
                            _medicineReminderController.text);

                      }
                    
                        Get.back();
                          _medicineReminderController.text="";
                      setState(() {
                        selectedTime=null;
                      });
                      MainController.to.selectMedicineReminder("");
                      }
                    },
                    child: const Text("Add"),
                  ),
                ],
              );
            }
          );
        });
  }
}
