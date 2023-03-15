import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Trackrecord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trackrecord"),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.only(left: 20, right: 20,top: 16,bottom: 100),
        child: LineChart(
          LineChartData(
            borderData: FlBorderData(
                border: Border.all(color: Colors.white, width: 0.5)),
            gridData: FlGridData(
              drawHorizontalLine: false,
            ),
            titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
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
                    interval: 4,
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      var text =
                          (value.toInt() == 0) ? '' : value.toInt().toString();

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
            maxY: 20,
            // lineBarsData: lineChartBarData,
          ),
        ),
        
      ),
      
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder:  (context) {
           return SimpleDialog(
            title: Text('seizure count'),
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
                hintText: "add an attack",
                fillColor: Colors.white70,
              ),
             // controller: _emailController,
            ),
            SizedBox(height: 40,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              onPressed: () async {
               
              },
              child: const Text("Add"),
            ),
            ],

           ) ;
          });
        },
        child: Icon(Icons.add,color: Colors.deepPurple,),
      ),
    );
  }
}
