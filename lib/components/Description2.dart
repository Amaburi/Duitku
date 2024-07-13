import 'package:duitkuproto/pages/SignIn.dart';
import 'package:duitkuproto/pages/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
class Description2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          width: screenWidth * 0.9, // Adjusted width based on screen size
          height: screenHeight * 0.3, // Adjusted height based on screen size
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.3,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFCFCFC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20), // Rounded corners for all sides
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.23,
                top: screenHeight * 0.25,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          color: Color(0xFF3C3C3C),
                          fontSize: screenHeight * 0.015, // Adjusted font size
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          color: Color(0xFF5774CD),
                          fontSize: screenHeight * 0.015, // Adjusted font size
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                              Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context)=> const SignIn())
                              );
                          }
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                left: screenWidth * 0.19,
                top: screenHeight * 0.19,
                child: Container(
                  width: screenWidth * 0.5, // Adjusted width based on screen size
                  height: screenHeight * 0.05, // Adjusted height based on screen size
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: screenWidth * 0.5,
                          height: screenHeight * 0.05,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFFC849),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.19,
                        top: screenHeight * 0.01,
                        child:  GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context)=> const SignUp())
                            );
                          },
                          child: Text(
                            'Sign Up',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.02, // Adjusted font size
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              height: 1.0,
                            ),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: screenWidth * 0.18,
                top: screenHeight * 0.07,
                child: Container(
                  width: screenWidth * 0.65,
                  height: screenHeight * 0.08,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Welcome Back ',
                                style: TextStyle(
                                  color: Color(0xFF494949),
                                  fontSize: screenHeight * 0.03, // Adjusted font size
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                ),
                              ),
                              TextSpan(
                                text: 'DuitKu',
                                style: TextStyle(
                                  color: Color(0xFF5774CD),
                                  fontSize: screenHeight * 0.03, // Adjusted font size
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                ),
                              ),
                              TextSpan(
                                text: '!',
                                style: TextStyle(
                                  color: Color(0xFF494949),
                                  fontSize: screenHeight * 0.03, // Adjusted font size
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Positioned(
                        left: screenWidth * 0.03,
                        top: screenHeight * 0.04,
                        child: SizedBox(
                          width: screenWidth * 0.5,
                          child: Text(
                            'Your ultimate money management solution',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF3C3C3C),
                              fontSize: screenHeight * 0.015, // Adjusted font size
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
