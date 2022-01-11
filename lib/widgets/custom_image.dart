import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final double? opacity;
  final double? height;
  final String? image;

  CustomImage({this.height, this.opacity, this.image});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity!,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 32.0),
        child: Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            image!,
            height: height,
          ),
        ),
      ),
    );
  }
}
