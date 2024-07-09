import 'package:flutter/material.dart';
import 'package:meme_generator/view/mainScreen.dart';
import 'package:meme_generator/view/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool showSplash = true;
  bool isLight = true;
  showSplashScreen() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        showSplash = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    showSplashScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meme Generator',
     
  theme: ThemeData.light(), // Light theme
  darkTheme: ThemeData.dark(), // Dark theme
  themeMode: isLight ? ThemeMode.light : ThemeMode.dark, // Choose theme based on isLight value
  
      home: showSplash? splashScreen(): mainScreen(),
    );
  }
}
