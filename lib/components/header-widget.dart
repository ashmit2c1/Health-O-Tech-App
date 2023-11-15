// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
        height: height / 10,
        width: width / 1.05,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height / 100),
            image: const DecorationImage(
                image: AssetImage("assets/images/container.png"),
                fit: BoxFit.cover)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: height / 100, left: width / 95),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "ABC's to XYZ's of",
                    style: TextStyle(
                        fontFamily: "Gotham",
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: height / 36),
                  ),
                  Text(
                    "Health Informatics",
                    style: TextStyle(
                        fontFamily: "Gotham",
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: height / 36),
                  ),
                ],
              ),
            ),
            Container(
              height: height / 14,
              width: width / 4,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/medium.png"),
                      fit: BoxFit.contain)),
            )
          ],
        ));
  }
}
