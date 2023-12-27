import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputWidgets extends StatelessWidget {
  InputWidgets({required this.controller, required this.label, super.key});
  TextEditingController controller;
  String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            hintText: label),
      ),
    );
  }
}
