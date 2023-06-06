import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import './landing_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        padding: const EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 0.0),
        child: const Image(
          image: AssetImage("assets/images/petshop_logo.png"),
        ),
      ),
      splashIconSize: 700,
      duration: 3000,
      splashTransition: SplashTransition.slideTransition,
      backgroundColor: Colors.pink.shade100,
      pageTransitionType: PageTransitionType.rightToLeft,
      nextScreen: const LandingPage(),
    );
  }
}
