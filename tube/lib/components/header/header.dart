import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class header extends StatelessWidget implements PreferredSizeWidget {
  @override
  @override
Widget build(BuildContext context) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Icon(LucideIcons.play, size: 18, color: Colors.blue),
            SizedBox(width: 6),
            Text("tubeet", style: GoogleFonts.oswald(fontSize: 18)),
          ],
        ),
        Row(
          children: [
            ShadIconButton.ghost(
              icon: Icon(LucideIcons.video, color: Colors.white),
              onPressed: () {

              },
            ),
            ShadIconButton.ghost(
              icon: Icon(LucideIcons.search, color: Colors.white),
              onPressed: () {

              },
            ),
            ShadIconButton.ghost(
              icon: Icon(LucideIcons.circleUser, color: Colors.white),
              onPressed: () {

              },
            ),
          ],
        ),
      ],
    ),
    automaticallyImplyLeading: false,
  );
}


  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
