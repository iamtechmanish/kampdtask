import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/Config.dart';
import 'MainScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(appIcon, width: 0.6.sw),
            Spacer(),
            SpinKitThreeBounce(size: 30.r,color: purple),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }
  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, NavigationPage);
  }

  void NavigationPage(){
    Get.to(MainScreen());
  }

}
