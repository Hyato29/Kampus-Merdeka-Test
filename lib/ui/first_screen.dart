import 'package:flutter/material.dart';
import 'package:km_test/ui/second_screen.dart';
import 'package:km_test/widgets/button_widget.dart';
import 'package:km_test/widgets/input_widgets.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController palindromeController = TextEditingController();

  bool checkPalindrome(String text) {
    String cleanedText = text.replaceAll(" ", "").toLowerCase();
    String reversedText = cleanedText.split('').reversed.join('');
    return cleanedText == reversedText;
  }

  void check(String text) {
    bool isPalindrome = checkPalindrome(text);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Result'),
        content: Text(isPalindrome ? 'Is Palindrome' : 'Not Palindrome'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const Image(
              image: AssetImage("assets/img/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  addPhoto(context),
                  const SizedBox(height: 50),
                  InputWidgets(controller: nameController, label: "Name"),
                  const SizedBox(height: 20),
                  InputWidgets(
                      controller: palindromeController, label: "Palindrome"),
                  const SizedBox(height: 40),
                  ButtonWidget(
                      button: () {
                        check(palindromeController.text);
                      },
                      label: "CHECK"),
                  const SizedBox(height: 15),
                  ButtonWidget(
                      button: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SecondScreen(
                            name: nameController.text,
                          );
                        }));
                      },
                      label: "NEXT")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ClipOval addPhoto(BuildContext context) {
    return ClipOval(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.width * 0.3,
        color: Colors.white.withOpacity(0.50),
        child: const Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
      ),
    );
  }
}
