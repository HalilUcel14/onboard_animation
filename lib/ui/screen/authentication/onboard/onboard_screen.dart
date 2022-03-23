import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:best_baltanem/best_baltanem.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vakifbank_sk/ui/screen/authentication/splash/splash_screen.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen>
    with SingleTickerProviderStateMixin {
  //
  late AnimationController controller;
  bool get isForwardAnimation =>
      controller.status == AnimationStatus.forward ||
      controller.status == AnimationStatus.completed;
  //
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      value: 0,
      duration: const Duration(seconds: 2),
      reverseDuration: const Duration(seconds: 2),
      vsync: this,
    )..addStatusListener((status) {
        setState(() {});
      });

    animationForward();
  }

  void animationForward() async {
    if (controller.status != AnimationStatus.completed) {
      await controller.forward();
    }
    if (controller.status == AnimationStatus.completed) {
      await controller.reverse();
      Navigator.pushNamed(context, SplashScreen.splashRoute);
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) => FadeScaleTransition(
            animation: controller,
            child: child,
          ),
          child: Visibility(
            visible: controller.status != AnimationStatus.dismissed,
            child: Image.asset(
              "assets/images/onboard/logo.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
