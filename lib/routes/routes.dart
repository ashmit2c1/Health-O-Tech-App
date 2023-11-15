import 'package:flutter/material.dart';
import 'package:healthotech/screen/article-screen.dart';
import 'package:healthotech/screen/gallery-screen.dart';
import 'package:healthotech/screen/main-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:healthotech/screen/new-event-screen.dart';
import 'package:healthotech/screen/play-podcast-screen.dart';
import 'package:healthotech/screen/podcast-list-screen.dart';

// routes for the application
class Routes {
  static const String mainScreenRoute = 'main-screen-route';
  static const String podcastScreenRoute = 'podcast-screen-route';
  static const String podcastListRoute = 'podcast-list-route';
  static const String articleScreenRoute = 'article-screen-route';
  static const String galleryScreenRoute = 'gallery-screen-route';
  static const String newEventScreenRoute = 'new-event-screen-route';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.mainScreenRoute:
        return CupertinoPageRoute(builder: (_) => const MainScreen());
      case Routes.podcastScreenRoute:
        return CupertinoPageRoute(builder: (_) => const PlayPodcastScreen());
      case Routes.podcastListRoute:
        return CupertinoPageRoute(builder: (_) => const PodcastListScreen());
      case Routes.articleScreenRoute:
        return CupertinoPageRoute(builder: (_) => const ArticleScreen());
      case Routes.galleryScreenRoute:
        return CupertinoPageRoute(builder: (_) => const GalleryScreen());
      case Routes.newEventScreenRoute:
        return CupertinoPageRoute(builder: (_) => const NewEventScreen());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              body: Center(
                child: Text("Undefined Route"),
              ),
            ));
  }
}
