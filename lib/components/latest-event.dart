// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LatestEventComponent extends StatelessWidget {
  const LatestEventComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'new-event-screen-route');
      },
      child: Container(
        height: height / 22,
        width: width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.deepOrange,
          Colors.deepOrangeAccent,
          Colors.orange,
          Colors.orange,
          Colors.orange,
          Colors.orange,
          Colors.yellowAccent,
        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: Center(
          child: Text(
            "Check out our upcoming events !",
            style: TextStyle(
                fontFamily: "Gotham",
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: height / 45),
          ),
        ),
      ),
    );
  }
}
