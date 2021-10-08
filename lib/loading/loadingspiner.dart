import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[400],
      // ignore: prefer_const_constructors
      child: Center(
        // ignore: prefer_const_constructors
        child: SpinKitChasingDots(
          color: Colors.brown,
          size: 46,
        ),
      ),
    );
  }
}
