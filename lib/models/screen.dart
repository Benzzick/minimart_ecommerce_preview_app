import 'package:flutter/material.dart';

class Screen {
  Screen({
    required this.icon,
    required this.label,
    required this.screen,
    required this.activeIcon,
  });
  final Image icon;
  final Image activeIcon;
  final String label;
  final Widget screen;
}
