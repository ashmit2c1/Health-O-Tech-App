// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ListenToSpotifyWidget extends StatelessWidget {
  final String text;
  final String animationPath;
  final VoidCallback function;
  const ListenToSpotifyWidget(
      {super.key,
      required this.text,
      required this.animationPath,
      required this.function});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: function,
      child: Container(
        height: height / 22,
        width: width,
        color: const Color.fromARGB(255, 57, 152, 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text,
                style: TextStyle(
                    fontFamily: "Gotham",
                    fontSize: height / 45,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            Lottie.asset(animationPath,
                frameRate: FrameRate(200), fit: BoxFit.cover)
          ],
        ),
      ),
    );
  }
}
