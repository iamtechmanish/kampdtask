import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kampd/Widgets/chart.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../Utils/Config.dart';
import 'dart:math' as math;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 18.0),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 25,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Container(
                decoration: BoxDecoration(
                    color: purple.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),

                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.only(right: 18),
                child: Center(
                    child: Text("Insight",
                        style: TextStyle(
                            color: purple, fontWeight: FontWeight.w900),))),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
               height: 5,
                width: double.infinity,
              ),

              Text(
                "DAILY STEPS",
                style: TextStyle(color: purple, fontWeight: FontWeight.bold, fontSize: 10),
              ),
              SizedBox(height: 5,),
              RichText(
                text: TextSpan(
                  // Note: Styles for TextSpans must be explicitly defined.
                  // Child text spans will inherit styles from parent
                  style: new TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(text: 'You have walked\n'),
                    TextSpan(
                        text: '40%',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: purple)),
                    TextSpan(text: '  of your goal'),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              CircularPercentIndicator(
                arcType: ArcType.FULL,
                arcBackgroundColor: Colors.grey.withOpacity(0.2),
                rotateLinearGradient: true,
                animationDuration: animationDuration,
                radius: 120.0,
                lineWidth: 16.0,
                animation: true,
                percent: 0.9,
                center: CircularStepProgressIndicator(
                  totalSteps: 36,
                  arcSize: math.pi / 2 * 3,
                  stepSize: 3,
                  startingAngle: 172,
                  currentStep: 0,
                  unselectedColor: Colors.grey.withOpacity(0.8),
                  width: 195,
                  height: 195,
                  roundedCap: (_, isSelected) => isSelected,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.directions_walk, size: 45, color: purple,),
                      SizedBox(height: 5,),
                      Text("7,235", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),),
                      SizedBox(height: 5,),
                      Text("steps")
                    ],
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: purple,
              ),
              Container(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularPercentIndicator(
                      animationDuration: animationDuration,
                      radius: 35.0,
                      lineWidth: 8.0,
                      percent: 0.50,
                      center: Icon(Icons.local_fire_department_outlined, color: cyan,),
                      progressColor: cyan,
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: cyan.withOpacity(0.2),
                      footer: Text("31 kcal", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    CircularPercentIndicator(
                      animationDuration: animationDuration,
                      radius: 35.0,
                      lineWidth: 8.0,
                      percent: 0.25,
                      center: Icon(Icons.location_on, color: purple2,),
                      progressColor: purple2,
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: purple2.withOpacity(0.2),
                      footer: Text("2 km", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    CircularPercentIndicator(
                      animationDuration: animationDuration,
                      radius: 35.0,
                      lineWidth: 8.0,
                      percent: 0.50,
                      center: Icon(Icons.pie_chart_rounded, color: blue,),
                      progressColor: blue,
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: blue.withOpacity(0.2),
                      footer: Text("50 min", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              LineChartSample()
            ],
          ),
        ),
      ),
    ));
  }
}
