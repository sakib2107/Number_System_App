import 'package:flutter/material.dart';
import 'main_nav.dart';
class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainNavScreen(),
            ),
          );
        },
        icon: const Icon(Icons.arrow_back),
        label: const Text("Back"),
      ),
    );
  }
}