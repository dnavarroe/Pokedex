import 'package:flutter/material.dart';

class IconType extends StatelessWidget {
  final String type;
  const IconType({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      child: Image.asset('assets/$type.png')
    );
  }
}