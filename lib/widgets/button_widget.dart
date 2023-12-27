import 'package:flutter/material.dart';
import 'package:km_test/common/common.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  ButtonWidget({required this.button, required this.label, super.key});

  Function() button;
  String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 32),
      child: ElevatedButton(
        onPressed: button,
        style: ElevatedButton.styleFrom(backgroundColor: primaryColors),
        child: Center(
            child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
