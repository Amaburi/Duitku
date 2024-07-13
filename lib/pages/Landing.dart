import 'package:duitkuproto/components/Description2.dart';
import 'package:flutter/material.dart';
import 'package:duitkuproto/utils/colors.dart';
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: customBlue,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset('assets/images/placeholder1.jpg',height: screenHeight*0.5 ,width: screenWidth*0.5,),
                      SizedBox(height: 16.0,)
                    ],
                  ),
                  SizedBox(height: 16.0,),
                  SizedBox(height: 16.0,),
                  SizedBox(height: 16.0,),
                  SizedBox(height: 16.0,),

                  Description2()
                ],
              ),
            ),
          )
        ),
    );
  }
}
