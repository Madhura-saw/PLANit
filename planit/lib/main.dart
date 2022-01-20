import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './page/home_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Google SignIn';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'assets/images/logo2.jpeg',
          // height: MediaQuery.of(context).size.width / 2.5,
          // width: MediaQuery.of(context).size.width / 2.5,
        ),
        splashIconSize: double.infinity,
        nextScreen: Homepage(),
        splashTransition: SplashTransition.sizeTransition,
        backgroundColor: const Color(0xffceeaee),
      ),
    );
  }
}
