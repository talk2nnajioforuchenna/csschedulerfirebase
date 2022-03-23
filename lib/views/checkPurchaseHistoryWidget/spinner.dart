import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinner extends StatelessWidget {
  const Spinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.all(50.0),
          child: SpinKitChasingDots(
            color: Colors.red,
            size: 100.0,
          ),
        ),
      ],
    );
  }
}
