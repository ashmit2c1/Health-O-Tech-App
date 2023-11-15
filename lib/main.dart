import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthotech/API/firebase-api.dart';
import 'package:healthotech/firebase_options.dart';
import 'package:healthotech/routes/routes.dart';
import 'package:healthotech/screen/splash-screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAPI().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: RouteGenerator.getRoute,
        title: 'Health O Tech',
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {'navigator-route': (context) => const SplashScreen()},
        home: const SplashScreen());
  }
}
