import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:lepseiz/controllers/main_controller.dart';
import 'package:lepseiz/utils/utils.dart';

import 'myTriggers.dart';

class Lepsydiary extends StatefulWidget {
  const Lepsydiary({super.key});

  @override
  State<Lepsydiary> createState() => _LepsydiaryState();
}

class _LepsydiaryState extends State<Lepsydiary> {
  var _triggersController = TextEditingController();
  var triggertext = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text(
            "Seizure Triggers",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Obx(() {
          return ListView(
              children: MainController.to.triggers.value.entries.map((e) {
            return ListTile(
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                    onPressed: () {
                      MainController.to.selectTrigger(e.key);
                      setState(() {
                        triggertext = "${e.value['triggerContent']}";
                      });
                      showEditDialogue();
                    },
                    icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: () async {
                      await MainController.to.deleteTriggers(e.key);
                    },
                    icon: Icon(Icons.delete)),
              ]),
              title: Text("${e.value['triggerContent']}"),
              onTap: () {
                Get.to(() => myTriggers());
              },
            );
          }).toList());
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            triggertext = "";
          });
          showEditDialogue();
        },
        child: Icon(
          Icons.add,
          color: Colors.black87,
        ),
      ),
    );
  }

  showEditDialogue() {
    _triggersController.text = triggertext;
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('Triggers'),
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
                  hintText: "add a trigger",
                  fillColor: Colors.white70,
                ),
                controller: _triggersController,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
                onPressed: () async {
                  if (_triggersController.text.isEmpty) {
                    Utils.showError('Trigger should not be empty');
                  } else {
                    if (triggertext.isNotEmpty) {
                      await MainController.to
                          .updateTriggers(_triggersController.text);
                    } else {
                      await MainController.to
                          .createTriggers(_triggersController.text);
                    }
                    Get.back();
                  }
                },
                child: const Text("Add"),
              ),
            ],
          );
        });
  }
}
