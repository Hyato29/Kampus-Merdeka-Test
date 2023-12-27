import 'package:flutter/material.dart';
import 'package:km_test/ui/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kampus Merdeka Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: "Poppins",
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const FirstScreen());
  }
}
