import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // <-- importa o dotenv
import 'package:google_fonts/google_fonts.dart';
import 'package:tube/pages/home_container/home_container_page.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      title: 'tube',
      theme: ShadThemeData(
        colorScheme: ShadGrayColorScheme.dark(),
        brightness: Brightness.dark,
        textTheme: ShadTextTheme(
          googleFontBuilder: GoogleFonts.oswald,
        ),
      ),
      home: const HomePage(),
    );
  }
}
