import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tube/pages/home/homePage.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ShadApp(
      title: 'tube',
      theme: ShadThemeData(
        colorScheme: ShadGrayColorScheme.dark(),
        brightness: Brightness.dark,
        textTheme: ShadTextTheme(
          googleFontBuilder: GoogleFonts.oswald,
        )
      ),
      home: HomePage()
    );
  }
}
