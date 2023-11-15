// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:healthotech/components/button-componenet.dart';
import 'package:healthotech/components/carousel-slider.dart';
import 'package:healthotech/components/header-widget.dart';
import 'package:healthotech/components/latest-event.dart';
import 'package:healthotech/components/listen-to-spotify.dart';
import 'package:healthotech/components/quote-component.dart';
import 'package:healthotech/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: height / 100,
              ),
              const HeaderWidget(),
              SizedBox(
                height: height / 100,
              ),
              ListenToSpotifyWidget(
                  text: "Listen to our latest podcast ",
                  animationPath: AnimationManager.podcastAnimation,
                  function: () {
                    Navigator.pushNamed(context, 'podcast-screen-route');
                  }),
              SizedBox(
                height: height / 100,
              ),
              const CarouselSliderComponent(),
              SizedBox(
                height: height / 100,
              ),
              const LatestEventComponent(),
              SizedBox(height: height / 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: <Widget>[
                      ButtonComponent(
                        text: "Articles",
                        img: ImageAssetManager.container,
                        function: () {
                          Navigator.pushNamed(context, 'article-screen-route');
                        },
                      ),
                      SizedBox(
                        height: height / 40,
                      ),
                      ButtonComponent(
                          text: "Podcasts",
                          img: ImageAssetManager.podcasts,
                          function: () {
                            Navigator.pushNamed(context, 'podcast-list-route');
                          }),
                      SizedBox(
                        height: height / 40,
                      ),
                      ButtonComponent(
                        text: "Gallery",
                        img: ImageAssetManager.galleryContainer,
                        function: () {
                          Navigator.pushNamed(context, 'gallery-screen-route');
                        },
                      ),
                    ],
                  ),
                  const QuoteComponent(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
