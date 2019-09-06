import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;

  const CustomText({
    Key key,
    @required this.text,
    this.color = Colors.grey,
    this.size = 14.0,
    this.weight = FontWeight.normal,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: weight),
    );
  }
}
