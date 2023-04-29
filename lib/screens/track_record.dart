import 'dart:html';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lepseiz/controllers/main_controller.dart';

class Trackrecord extends StatefulWidget {
  @override
  State<Trackrecord> createState() => _TrackrecordState();
}

class _TrackrecordState extends State<Trackrecord> {
  var _seizureTrackController = TextEditingController();
  var months = [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "SEP",
    "OCT",
    "NOV",
    "DEC"
  ];
  var selectedmonth = 0;

  int seizureTracktext = 0;

  var year = DateTime.now().year;

  var trackingData = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  @override
  void initState() {
    Future.microtask(
        () async => await MainController.to.getSeizureTrack(year: year));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trackrecord"),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 100),
        child: Obx(() {
          return LineChart(
            LineChartData(
              borderData: FlBorderData(
                  border: Border.all(color: Colors.white, width: 0.5)),
              gridData: FlGridData(
                drawHorizontalLine: false,
              ),
              titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                    interval: 1,
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      var text = "";

                      switch (value.toInt()) {
                        case 1:
                          text = 'Jan';
                          break;
                        case 2:
                          text = 'Feb';
                          break;
                        case 3:
                          text = 'Mar';
                          break;
                        case 4:
                          text = 'Apr';
                          break;
                        case 5:
                          text = 'May';
                          break;
                        case 6:
                          text = 'Jun';
                          break;
                        case 7:
                          text = 'Jul';
                          break;
                        case 8:
                          text = 'Aug';
                          break;
                        case 9:
                          text = 'Sep';
                          break;
                        case 10:
                          text = 'Oct';
                          break;
                        case 11:
                          text = 'Nov';
                          break;
                        case 12:
                          text = 'Dec';
                          break;
                      }

                      return Text(
                        text,
                        style: const TextStyle(
                            color: Colors.teal,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      );
                    },
                  )),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      interval: 5,
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        var text = (value.toInt() == 0)
                            ? ''
                            : value.toInt().toString();

                        return Text(
                          text,
                          style: const TextStyle(
                              color: Colors.teal,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                  )),
              minX: 1,
              minY: 0,
              maxX: 12,
              maxY: 100,
              lineBarsData: [getLineBarData()],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showEditDialogue();
        },
        child: const Icon(
          Icons.add,
          color: Colors.deepPurple,
        ),
      ),
    );
  }

  getLineBarData() {
    return LineChartBarData(
      isCurved: false,
      color: Colors.green,
      barWidth: 6,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: (MainController.to.singleSeizureTrack.isEmpty
              ? trackingData
              : MainController.to.singleSeizureTrack["data"] as List)
          .asMap()
          .entries
          .map(
            (e) => FlSpot(e.key.toDouble() + 1, e.value),
          )
          .toList(),
    );
  }

  showEditDialogue() {
    _seizureTrackController.text = MainController.to.singleSeizureTrack.isEmpty
        ? 0.toString()
        : (MainController.to.singleSeizureTrack["data"] as List)[selectedmonth]
            .toString();
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return SimpleDialog(
              contentPadding: const EdgeInsets.all(10),
              title: const Text('seizure count'),
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: months
                            .map((e) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedmonth = months.indexOf(e);
                                    });
                                    _seizureTrackController
                                        .text = MainController
                                            .to.singleSeizureTrack.isEmpty
                                        ? 0.toString()
                                        : (MainController.to
                                                    .singleSeizureTrack["data"]
                                                as List)[selectedmonth]
                                            .toString();
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    color: selectedmonth == months.indexOf(e)
                                        ? Colors.black
                                        : Colors.teal,
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ))
                            .toList(),
                      )),
                ),
                TextField(
                  keyboardType: TextInputType.number,
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
                    hintText: "Add an attack",
                    fillColor: Colors.white70,
                  ),
                  controller: _seizureTrackController,
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50)),
                  onPressed: () async {
                    if (_seizureTrackController.text.isNotEmpty) {
                      await MainController.to.editSeizureTrack(
                          selectedmonth,
                          DateTime.now().year,
                          int.tryParse(_seizureTrackController.text) ?? 0);

                      Get.close(1);
                    }
                  },
                  child: const Text("Add"),
                ),
              ],
            );
          });
        });
  }
}

