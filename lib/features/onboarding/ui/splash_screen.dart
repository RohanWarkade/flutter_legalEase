import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_legalease/features/onboarding/ui/onboarding_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Onbording()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Lottie.network(
          'https://lottie.host/83e15d8d-035e-4af0-a315-e9242b6d0b5c/Q7u5jty67s.json'),
    ));
  }
}
