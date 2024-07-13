import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String Desc;
  final String Desc2;
  DescriptionWidget({required this.Desc,required this.Desc2});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight * 0.3, // Adjust height as needed
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromRGBO(87, 116, 205, 1),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.25, // Adjust top position as needed
            left: 20,
            child: Container(
              width: 94,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromRGBO(255, 200, 73, 1),
              ),
              child: Center(
                child: Text(
                  'Get Started',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(60, 60, 60, 1),
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.25, // Adjust top position as needed
            right: 20,
            child: Text(
              'Next',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.normal,
                height: 1.5,
              ),
            ),
          ),
          Positioned(
            top: 57,
            left: 20,
            child: Text(
              Desc,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.normal,
                height: 0.9,
              ),
            ),
          ),
          Positioned(
            top: 86,
            left: 20,
            right: 20,
            child: Text(
              Desc2,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Poppins',
                fontSize: 11,
                fontWeight: FontWeight.normal,
                height: 1.2727272727272727,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
