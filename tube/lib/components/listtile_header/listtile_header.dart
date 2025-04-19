import 'package:flutter/material.dart';

class ListTitleHeader extends StatelessWidget {
  const ListTitleHeader({super.key , required this.titleHeader, required this.iconLeading});

  final String titleHeader;
  final IconData iconLeading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.lightBlue,
        child: Icon(iconLeading, size: 28),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      title: Text(titleHeader, style: TextStyle(fontSize: 28)),
    );
  }
}
