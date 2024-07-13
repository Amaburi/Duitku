import 'package:duitkuproto/pages/introduce.dart';
import 'package:flutter/material.dart';
import 'package:splashify/splashify.dart';

import '../main.dart';
class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splashify(
        title: 'Duitku',
        imagePath: 'assets/images/splashh.jpg',
        imageSize: 250,
        navigateDuration: 3, // Navigate to the child widget after 3 seconds
        child: Introduce(), // Your main app screen widget
      ),
    );
  }
}
