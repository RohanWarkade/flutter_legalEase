import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_legalease/design/app_theme.dart";
import "package:flutter_legalease/firebase_options.dart";

import "features/onboarding/ui/splash_screen.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: SplashScreen(),
    );
  }
}
