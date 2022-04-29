import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kampd/Controllers/ButtonsController.dart';
import 'package:kampd/Utils/Config.dart';

// ignore: must_be_immutable
class LineChartSample extends StatelessWidget {

  final spots = const [
    FlSpot(0, 1),
    FlSpot(1, 1.5),
    FlSpot(2, 1.4),
    FlSpot(3, 2),
    FlSpot(4, 1.8),
    FlSpot(5, 2.6),
    FlSpot(6, 1),
  ];

  late double minSpotX, maxSpotX;
  late double minSpotY, maxSpotY;

  LineChartSample({Key? key}) : super(key: key) {
    minSpotX = 0;
    maxSpotX = 6;
    minSpotY = 0;
    maxSpotY = 5;
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.deepOrange,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );

    final intValue = value.toInt();

    if (intValue == (maxSpotY + minSpotY)) {
      return const Text('', style: style);
    }

    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Text(
        intValue.toString(),
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }


  Widget bottomTitleWidgets(num value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 10,
      color: Colors.white,
    );
    switch(value){
      case 0 :
        return Center(child: Text("Mo", style: style));

      case 1 :
        return Center(child: Text("Tu", style: style));

      case 2 :
        return Center(child: Text("We", style: style));
      case 3 :
        return Center(child: Text("Th", style: style));
      case 4 :
        return Center(child: Text("Fr", style: style));
      case 5 :
        return Center(child: Text("Sa", style: style));
      case 6 :
        return Center(child: Text("Su", style: style));
      default:
        return Center(child: Text("", style: style));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), color: purple.withOpacity(0.9)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: SizedBox(
          width: double.infinity,
          height: 180,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: double.infinity,),
              getButtons(),
              Expanded(
                child: LineChart(
                  LineChartData(
                    lineTouchData: LineTouchData(enabled: false),
                    lineBarsData: [
                      LineChartBarData(
                        shadow: Shadow(color: Colors.black.withOpacity(0.5), offset: Offset.fromDirection(2,3), blurRadius: 5),
                        gradient: const LinearGradient(
                          colors: [
                            Colors.lightBlueAccent,
                            Colors.blue,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        spots: spots,
                        isCurved: true,
                        isStrokeCapRound: true,
                        barWidth: 5,
                        belowBarData: BarAreaData(
                          show: false,
                        ),
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            return
                              index==6?FlDotCirclePainter(radius: 4, color: purple, strokeColor: Colors.white, strokeWidth: 5):
                              FlDotCirclePainter(radius: index==0?5:4, color: index==0?cyan:cyan.withOpacity(0.8), strokeColor: Colors.transparent);
                          }

                        ),
                      ),
                    ],
                    minY: 0,
                    maxY: maxSpotY + minSpotY,
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                          reservedSize: 38,
                        ),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(
                            showTitles: false,
                            reservedSize: 30),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true,
                          reservedSize: 32,
                          getTitlesWidget: bottomTitleWidgets,),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                    ),
                    gridData: FlGridData(
                        show: true,
                        drawVerticalLine: true,
                        drawHorizontalLine: false,
                        getDrawingVerticalLine: defaultGridLine

                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: const Border(
                        left: BorderSide(width: 0.5, color: Colors.white),
                        top: BorderSide(color: Colors.transparent),
                        bottom: BorderSide(color: Colors.transparent),
                        right: BorderSide(color: Colors.white, width: 0.5),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FlLine defaultGridLine(double value) {
    return FlLine(
      color: Colors.white,
      strokeWidth: 0.5,

    );
  }

  ButtonController buttonController = Get.put(ButtonController());

  Widget getButtons(){
    return
      Obx(
          (){
            return  Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      buttonController.selectButton.value = 0;
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: buttonController.selectButton.value==0?purple:Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        margin: EdgeInsets.only(right: 18),
                        child: Center(
                            child: Text("DAILY",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white, fontWeight: FontWeight.bold),))),
                  ) ,
                  GestureDetector(
                    onTap: (){
                      buttonController.selectButton.value = 1;
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: buttonController.selectButton.value==1?purple:Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        margin: EdgeInsets.only(right: 18),
                        child: Center(
                            child: Text("WEEK",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white, fontWeight: FontWeight.bold),))),
                  ) ,
                  GestureDetector(
                    onTap: (){
                      buttonController.selectButton.value = 2;
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: buttonController.selectButton.value==2?purple:Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Center(
                            child: Text("MONTH",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white, fontWeight: FontWeight.bold),))),
                  ) ,
                ],
              ),
            );
          }
      );


  }




}
