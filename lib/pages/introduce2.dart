import 'package:duitkuproto/components/tracker.dart';
import 'package:duitkuproto/pages/introduce3.dart';

import 'package:flutter/material.dart';

import '../components/Description.dart';
class Introduce2 extends StatelessWidget {
  const Introduce2({super.key});

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
                MaterialPageRoute(builder: (context) => const Introduce3())
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
                    Tracker(currentIndex: 1),
                  ],
                ),
                SizedBox(height: 16.0), // Adds spacing between the image and the text
                DescriptionWidget(Desc: 'Financial Clarity at a Glance',Desc2: 'Explore your complete income and expense history enables you to thoroughly examine your financial transactions, empowering better management of your finances',),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
