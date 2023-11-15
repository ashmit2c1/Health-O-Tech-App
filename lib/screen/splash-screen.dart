// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:healthotech/utils/constants.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, 'main-screen-route');
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  height: height / 10,
                  width: width / 2,
                  child: Lottie.asset(AnimationManager.loadingAnimation,
                      frameRate: FrameRate(120))),
              Text(
                "Health O Tech",
                style: TextStyle(
                    fontFamily: "Gotham",
                    color: const Color.fromARGB(255, 98, 98, 98),
                    fontWeight: FontWeight.w200,
                    fontSize: height / 50),
              )
            ],
          ),
        ),
      ),
    );
  }
}
