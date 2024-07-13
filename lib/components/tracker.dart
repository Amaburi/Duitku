import 'package:flutter/material.dart';

class Tracker extends StatelessWidget {
  final int currentIndex;

  Tracker({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    // Define the positions for the indicators
    List<double> positions = [0.0, 17.0, 34.0];

    return Container(
      width: 39,
      height: 5,
      child: Stack(
        children: <Widget>[
          // Blue indicator
          Positioned(
            top: 0,
            left: positions[currentIndex],
            child: Container(
              width: 5, // Adjusted width to match the grey indicators
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromRGBO(64, 123, 255, 1),
              ),
            ),
          ),
          // Grey indicators
          for (int i = 0; i < positions.length; i++)
            if (i != currentIndex)
              Positioned(
                top: 0,
                left: positions[i],
                child: Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
