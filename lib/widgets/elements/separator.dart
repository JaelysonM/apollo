import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final Color color;
  const Separator({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 0.8, color: color.withOpacity(0.3));
  }
}
