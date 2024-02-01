import 'package:app_00_board/config/palette.dart';
import 'package:flutter/material.dart';

class LoginSingupScreen extends StatefulWidget {
  const LoginSingupScreen({Key? key}) : super(key: key);

  @override
  State<LoginSingupScreen> createState() => _LoginSingupScreenState();
}

class _LoginSingupScreenState extends State<LoginSingupScreen> {
  bool isSignupScreen = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.amber[800],
              ),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 90,
                    left: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Welcome',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: ' to Han Ppyem',
                              style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('signup to continue',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 180,
            child: Container(
              padding: EdgeInsets.all(20.0),
              height: 280.0,
              // 각 디바이스별 사이즈 적용
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Palette.activeColor,
                            ),
                          ),
                          Container(
                            height: 2,
                            width: 55,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'SINGUP',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Palette.textColor1,
                            ),
                          ),
                          Container(
                            height: 2,
                            width: 55,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
