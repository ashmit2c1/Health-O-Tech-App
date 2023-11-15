// ignore_for_file: file_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:healthotech/screen/event-screen.dart';
import 'package:healthotech/screen/home-screen.dart';

List pages = const [
  HomeScreen(),
  EventScreen(),
];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  void onPageChange(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        onTap: onPageChange,
        height: height / 15,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        color: const Color.fromARGB(255, 0, 70, 113),
        animationDuration: const Duration(milliseconds: 200),
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.event_available_rounded,
            color: Colors.white,
          ),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
