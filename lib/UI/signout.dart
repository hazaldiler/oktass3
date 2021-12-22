import 'package:flutter/material.dart';
import 'package:ymgk_cloud_project/service/auth_service.dart';

class Signout extends StatefulWidget {
  const Signout({Key? key}) : super(key: key);

  @override
  _SignoutState createState() => _SignoutState();
}

class _SignoutState extends State<Signout> {
  AuthService _authService = AuthService();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          '9OKTAS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          _authService.signOut();
          Navigator.pop(context);
        },
        child: Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                "SİGNOUT",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.blue),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
