import 'package:flutter/material.dart';
import 'package:km_test/ui/third_screen.dart';
import 'package:km_test/widgets/button_widget.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({required this.name, super.key});

  final String name;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late String selectedUserName;

  @override
  void initState() {
    super.initState();
    selectedUserName = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bodyContent(),
            ButtonWidget(
                button: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThirdScreen(),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      selectedUserName = result;
                    });
                  }
                },
                label: "Choose a User")
          ],
        ),
      ),
    );
  }

  Column bodyContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Text("Welcome"),
        Text(selectedUserName),
      ],
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Second Screen",
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }
}
