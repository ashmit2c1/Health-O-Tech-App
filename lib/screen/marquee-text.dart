// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class MarqueeText extends StatelessWidget {
  const MarqueeText({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Center(
      child: SizedBox(
        height: height / 20,
        width: width / 1.1,
        child: Center(
          child: Marquee(
            blankSpace: 100,
            velocity: 50,
            style: TextStyle(
                fontFamily: 'Gotham',
                fontWeight: FontWeight.bold,
                fontSize: height / 30),
            text: "Driving change in India's Healthcare System",
          ),
        ),
      ),
    );
  }
}
