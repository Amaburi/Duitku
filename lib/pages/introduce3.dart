import 'package:duitkuproto/components/Description.dart';
import 'package:duitkuproto/components/tracker.dart';
import 'package:duitkuproto/pages/Landing.dart';
import 'package:flutter/material.dart';
class Introduce3 extends StatelessWidget {
  const Introduce3({super.key});


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SizedBox(
          height: AppBar().preferredSize.height,

          child: Image.asset('assets/images/profile2.png', fit: BoxFit.contain),
        ),
        actions: <Widget>[
          IconButton(onPressed: ()=>{
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LandingPage())
            ),
          }, icon: Icon(Icons.navigate_next), tooltip: 'Press To Skip',)
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min, // Adjusts the column to take the minimum space required
                  children: <Widget>[
                    Image.asset('assets/images/placeholder1.jpg', height: screenHeight * 0.5 , width: screenWidth * 0.5,),
                    SizedBox(height: 16.0), // Adds spacing between the image and the text
                    Tracker(currentIndex: 2),
                  ],
                ),
                SizedBox(height: 16.0), // Adds spacing between the image and the text
                DescriptionWidget(Desc: 'Stay Ahead of Your Finances',Desc2: 'Monitor your expenses and income seamlessly ensures effortless tracking of your financial inflows and outflows',),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
