import 'package:flutter/material.dart';
import 'package:image_ui_demo/constant/constants.dart';
import 'package:image_ui_demo/splash/splash_screen.dart';
import 'package:image_ui_demo/ui/lab_test_home.dart';

void main() => runApp(
      MaterialApp(
        title: '1mg Lab Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        routes: <String, WidgetBuilder>{
          Constants.splashScreen: (BuildContext context) =>
              const AnimatedSplashScreen(),
          Constants.labTest: (BuildContext context) => const LabTest(),
        },
        initialRoute: Constants.splashScreen,
      ),
    );
