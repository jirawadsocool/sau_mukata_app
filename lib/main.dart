import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'views/splash_screen_ui.dart';

void main() {
  runApp(const _Mukata());
}

class _Mukata extends StatefulWidget {
  const _Mukata({super.key});

  @override
  State<_Mukata> createState() => __MukataState();
}

class __MukataState extends State<_Mukata> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        )
      ),
    );
  }
}