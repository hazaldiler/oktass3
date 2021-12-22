import 'package:flutter/material.dart';
import 'package:ymgk_cloud_project/UI/OutlineBtn.dart';
import 'package:ymgk_cloud_project/UI/PrimaryButton.dart';
import 'package:ymgk_cloud_project/UI/home.page.dart';
import 'package:ymgk_cloud_project/UI/signout.dart';
import 'package:ymgk_cloud_project/service/auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int pagestate = 0;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //final fieldText = TextEditingController();

  void clearText() {
    _emailController.clear();
    _passwordController.clear();
  }

  AuthService _authService = AuthService();
  bool _isObscure = true;

  //Pagestate: this variable is used to specify the page we are dealing with (0 -> splashscreen , 1-> login , 2-> signup)

  var _backgroundColor = Colors.white;

  //bgcolor: this variabe is used to change the bgcolor during the change between pages (splash: white , login/up: blue)
  var _headingColor = Colors.white;

  //hdcolor: changing the header color while moving around pages

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;

  //Each one of this offest values used to setup the x and the y of the login/signup cards

  double _headingTop = 80;

  //used bcz while switching between login and signup the header will change its y a little bit

  double _loginWidth = 0;
  double _loginHeight = 0;
  double _registerHeight = 0;
  double _loginOpacity = 1;

  //used to make login card width & opacity changes dynamically

  double _sprtclsOpacity = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    //Getting the width and the height of the platform

    _loginHeight = windowHeight - 270;
    //windowHight - _loginYOffset (line 98)
    _registerHeight = windowHeight - 270;

    switch (pagestate) {
      case 0:
        //Case 0 refers to the splashscreen page and showing the changes that will happen to all elements when switching to it
        _backgroundColor = Colors.white;
        _headingColor = Colors.blue;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _sprtclsOpacity = 0;

        _headingTop = 120;

        _loginYOffset = windowHeight;
        _loginXOffset = 0;
        _registerYOffset = windowHeight;

        break;

      case 1:
        //Case 1 refers to the login page and showing the changes that will happen to all elements when switching to it
        _backgroundColor = Colors.blue;
        _headingColor = Colors.white;

        _loginWidth = windowWidth;
        _loginOpacity = 1;

        _sprtclsOpacity = 1;

        _headingTop = 70;

        _loginYOffset = 270;
        _loginXOffset = 0;
        _registerYOffset = windowHeight;
        break;

      case 2:
        //Case 2 refers to the signup page and showing the changes that will happen to all elements when switching to it
        _backgroundColor = Colors.blue;
        _headingColor = Colors.white;

        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;

        _sprtclsOpacity = 1;

        _headingTop = 60;

        _loginYOffset = 250;
        _loginXOffset = 20;
        _registerYOffset = 270;

        break;
    }
    return Stack(
      //Using stack widget to stack elements in the top of each others (stacking ards)
      children: <Widget>[
        GestureDetector(
          onTap: () {
            if (pagestate == 0) return;
            setState(() {
              pagestate = 0;
              //Returning to splashscreen page
            });
          },
          child: AnimatedContainer(
              //Image + BG + Text Elements
              duration: Duration(milliseconds: 1000),
              color: _backgroundColor,
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          //Splashscreen's text elements
                          child: Column(children: <Widget>[
                        AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(milliseconds: 1000),
                          padding: EdgeInsets.only(top: _headingTop, right: 20),
                          child: Text(
                              //HEADER
                              "9OKTAS Bulut Depolama",
                              style: TextStyle(
                                  color: _headingColor,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(padding: const EdgeInsets.only(top: 20)),
                        Container(
                          //TEXT (DESCRIPTION)
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: Text(
                              "Dijital varlıklarınızı en güvenli şekilde saklayabilmek için en iyi bulut yedekleme platformu",
                              style:
                                  TextStyle(color: _headingColor, fontSize: 16),
                              textAlign: TextAlign.center),
                        )
                      ])),
                      Container(
                          //Splashscreen's Image
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                          ),
                          child: Center(
                              child: Image.asset(
                                  "assets/images/splashscreen.png"))),
                      Container(
                        //Button
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              //Tapping on the Get Started button will change the state of the page to the login page
                              if (pagestate != 0)
                                pagestate = 0;
                              else
                                pagestate = 1;
                            });
                          },
                          child: Container(
                              //Button (Boxdecoration + Text)
                              margin: EdgeInsets.all(12),
                              padding: EdgeInsets.all(20),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                  child: Text(
                                "Get Started",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ))),
                        ),
                      )
                    ]),
              )),
        ),
        AnimatedContainer(
            padding: EdgeInsets.all(32),
            width: _loginWidth,
            height: _loginHeight,
            duration: Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            transform:
                Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
            //Changing the x and y of the login card dynamically while changing the pages (0:SplashScreen -> X = 0 (disappeard))
            decoration: BoxDecoration(
                //Card is a box decoration widget with some modifications
                color: Colors.white.withOpacity(_loginOpacity),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text("Login To Continue",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w600))),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          contentPadding: EdgeInsets.symmetric(vertical: 28),
                          border: InputBorder.none,
                          hintText: "Enter Email..."),
                      //hintText: "Enter Email..."),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    //width: 60,
                    child: TextField(
                      controller: _passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
                          contentPadding: EdgeInsets.symmetric(vertical: 28),
                          border: InputBorder.none,
                          hintText: 'Enter Password...',
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              })),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          /*PrimaryButton(
                            btnText: "Login",
                          ),*/
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              _authService
                                  .signIn(_emailController.text,
                                      _passwordController.text)
                                  .then((value) {
                                return Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              });
                              clearText();
                            },
                            child: PrimaryButton(
                              btnText: "Login",
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                          ),
                          GestureDetector(
                            //create new account butonuna bastığımızda textfild ları getirir
                            onTap: () {
                              setState(() {
                                //Tapping on the login card will send you to the signup card
                                pagestate = 2;
                              });
                            },
                            child: OutlineBtn(
                              btnText: "Create New Account",
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Image.asset(
                                  "assets/images/logowithname.png",
                                  height: 40,
                                  width: 150)),
                        ]),
                  ),
                ],
              ),
            )),
        AnimatedContainer(
            height: _registerHeight,
            padding: EdgeInsets.all(32),
            duration: Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,

            //Sign up Card (BoxDecoration)
            transform: Matrix4.translationValues(0, _registerYOffset, 1),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text("Create a New Account",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w600))),
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          contentPadding: EdgeInsets.symmetric(vertical: 28),
                          border: InputBorder.none,
                          hintText: "Enter Email..."),
                      //hintText: "Enter Email..."),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    //width: 60,
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
                          contentPadding: EdgeInsets.symmetric(vertical: 28),
                          border: InputBorder.none,
                          hintText: "Enter Password..."),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),

                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            _authService
                                .createPerson(_emailController.text,
                                    _passwordController.text)
                                .then((value) {
                              return Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signout()));
                            });
                            clearText();
                          },
                          child: PrimaryButton(
                            btnText: "Create Account",
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              pagestate = 1;
                            });
                          },
                          child: OutlineBtn(
                            btnText: "Back To Login",
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Image.asset("assets/images/logowithname.png",
                                height: 40, width: 150)),
                      ]),
                ],
              ),
            ))
      ],
    );
  }
}
