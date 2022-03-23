import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KeyValueWidget extends StatelessWidget {
  final String title;
  final String value;
  final double fontSize;
  const KeyValueWidget(
      {Key? key, required this.title, required this.value, this.fontSize = 18})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: TextStyle(fontSize: fontSize - 2),
          ),
          Flexible(
            child: Text(
              value,
              style: GoogleFonts.domine(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
