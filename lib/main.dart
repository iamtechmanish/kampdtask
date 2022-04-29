import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Utils/Config.dart';
import 'Utils/my_routes.dart';
import 'Screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {


    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appColor,
      statusBarBrightness: Brightness.dark,
    ));

    return ScreenUtilInit(builder: (_)=>GetMaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.splashRoute,
      routes: {
        MyRoutes.splashRoute: (context) => SplashScreen(),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    )


    );
  }
}

