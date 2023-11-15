// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:healthotech/models%20&%20data/carousel-model-data.dart';

class CarouselSliderComponent extends StatelessWidget {
  const CarouselSliderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return CarouselSlider.builder(
        itemCount: carouselList.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(carouselList[index].img),
                    fit: BoxFit.cover),
                color: Colors.blue,
                borderRadius: BorderRadius.circular(height / 50)),
          );
        },
        options: CarouselOptions(
          height: height / 4,
          viewportFraction: 0.76,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 200),
        ));
  }
}
