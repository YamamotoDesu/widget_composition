import 'package:flutter/material.dart';

class GrayedWidget extends StatelessWidget {
  final Widget child;

  const GrayedWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: const ColorFilter.mode(
        Colors.grey,
        BlendMode.saturation,
      ),
      child: child,
    );
  }
}
