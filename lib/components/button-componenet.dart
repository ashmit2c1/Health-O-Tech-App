// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final String text;
  final String img;
  final VoidCallback function;
  const ButtonComponent(
      {super.key,
      required this.text,
      required this.img,
      required this.function});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: function,
      child: Container(
        height: height / 10,
        width: width / 2.2,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(height / 50),
            color: Colors.blue),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Gotham",
                fontWeight: FontWeight.w600,
                fontSize: height / 50),
          ),
        ),
      ),
    );
  }
}
