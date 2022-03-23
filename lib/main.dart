import 'package:flutter/material.dart';
import 'package:vakifbank_sk/ui/screen/authentication/onboard/onboard_screen.dart';
import 'package:vakifbank_sk/ui/screen/authentication/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vakıfbank Spor Kulübü',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => OnboardScreen(),
        SplashScreen.splashRoute: (context) => SplashScreen(),
      },
      // home: const OnboardScreen(),
    );
  }
}
