import 'package:flutter/material.dart';

class TableText extends StatelessWidget {
  final String text;
  const TableText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Text(text),
    );
  }
}
