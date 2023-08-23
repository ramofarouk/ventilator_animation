import 'package:flutter/material.dart';

class ButtonFan extends StatelessWidget {
  final VoidCallback callback;
  final int value, step;
  const ButtonFan(
      {required this.callback,
      required this.value,
      required this.step,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: 15,
        height: 15,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: (step == value) ? Colors.deepPurple : Colors.black,
            borderRadius: BorderRadius.circular(2)),
        child: Text(
          value.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    );
  }
}
