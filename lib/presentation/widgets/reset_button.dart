import 'package:flutter/material.dart';
import '../provider/converter_provider.dart';
class ResetButton extends StatelessWidget {
  const ResetButton({
    super.key,
    required this.controller,
    required this.provider,
  });

  final TextEditingController controller;
  final NumberSystemProvider provider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: () {
          controller.clear(); // clear input field
          provider.clear();
        },
        icon: const Icon(Icons.refresh),
        label: const Text("Reset"),
      ),
    );
  }
}