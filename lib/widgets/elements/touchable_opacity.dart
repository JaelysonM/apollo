import 'package:flutter/material.dart';

class TouchableOpacity extends StatefulWidget {
  final VoidCallback? onTap;

  final Widget child;

  const TouchableOpacity({Key? key, this.onTap, required this.child})
      : super(key: key);

  @override
  State<TouchableOpacity> createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  bool isTappedDown = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          isTappedDown = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          isTappedDown = false;
        });
      },
      onTap: () => widget.onTap?.call(),
      // Decrease the opacity of child with delay when the user is not touching the button
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        opacity: isTappedDown ? 0.5 : 1,
        child: widget.child,
      ),
    );
  }
}
