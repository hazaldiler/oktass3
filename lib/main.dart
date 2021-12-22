import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'UI/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //Specifiying the font for the whole program with ThemeData() widget
        theme: ThemeData(
          fontFamily: "Centurey Gothic",
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
                child: Center(
          child: LoginPage(),
          //Calling the login page which is stfl widget
        ))));
  }
}
