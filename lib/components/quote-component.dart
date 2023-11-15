// ignore_for_file: file_names

import 'package:flutter/material.dart';

class QuoteComponent extends StatelessWidget {
  const QuoteComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height / 2.6,
      width: width / 2.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height / 50),
          image: const DecorationImage(
              image: AssetImage("assets/images/vs.png"), fit: BoxFit.cover)),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height / 4.19,
              ),
              Text(
                " \"Enriching experience, will cherish forever\"",
                style: TextStyle(
                    fontFamily: "Gotham",
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: height / 45),
              ),
              Text(
                "~Varun Singla@PULSE 1.0",
                style: TextStyle(
                    fontFamily: "Gotham",
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: height / 64),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
