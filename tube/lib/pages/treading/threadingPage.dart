import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Threadingpage extends StatefulWidget {
  const Threadingpage({super.key});

  @override
  State<Threadingpage> createState() => _ThreadingpageState();
}

class _ThreadingpageState extends State<Threadingpage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(28),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    child: Icon(Icons.whatshot, size: 28),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  title: Text("Em alta", style: TextStyle(fontSize: 28)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
