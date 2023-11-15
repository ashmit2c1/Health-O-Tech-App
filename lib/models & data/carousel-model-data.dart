// ignore_for_file: file_names

import 'package:healthotech/utils/constants.dart';

// carousel model and
class CarouselModel {
  final String img;
  final String link;
  CarouselModel({required this.img, required this.link});
}

final carouselModel1 =
    CarouselModel(img: ImageAssetManager.carousel1, link: "");
final carouselModel2 =
    CarouselModel(img: ImageAssetManager.carousel2, link: "");
final carouselModel3 =
    CarouselModel(img: ImageAssetManager.carousel3, link: "");
final carouselModel4 =
    CarouselModel(img: ImageAssetManager.carousel4, link: "");
final carouselModel5 =
    CarouselModel(img: ImageAssetManager.carousel5, link: "");

final List<CarouselModel> carouselList = [
  carouselModel1,
  carouselModel2,
  carouselModel3,
  carouselModel4,
  carouselModel5
];
