// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:healthotech/utils/constants.dart';
import 'package:lottie/lottie.dart';

class NewEventScreen extends StatelessWidget {
  const NewEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'NEW EVENTS',
              style: TextStyle(
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.w300,
                  fontSize: height / 60),
            ),
            Text(
              'HEALTH O TECH',
              style: TextStyle(
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.w500,
                  fontSize: height / 60),
            ),
          ],
        ),
      ),
      body: Center(
        child: SizedBox(
          height: height / 2,
          width: width,
          child: Column(
            children: [
              Center(
                child: Lottie.asset(AnimationManager.noNewAnimation,
                    height: height / 5),
              ),
              const Center(
                child: Text(
                  "No new events for now, but don't worry",
                  style: TextStyle(
                    fontFamily: "Gotham",
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "We are cooking :)",
                  style: TextStyle(
                      fontFamily: "Gotham", fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
