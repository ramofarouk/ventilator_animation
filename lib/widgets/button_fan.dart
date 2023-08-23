import 'package:flutter/material.dart';

class ButtonFan extends StatefulWidget {
  const ButtonFan(StateSetter setState, {super.key});

  @override
  State<ButtonFan> createState() => _ButtonFanState();
}

class _ButtonFanState extends State<ButtonFan> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector();
  }
}
