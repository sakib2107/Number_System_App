import 'package:flutter/material.dart';
import '../provider/converter_provider.dart';
class ResultShow extends StatelessWidget {
  const ResultShow({
    super.key,
    required this.provider,
  });

  final NumberSystemProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Result : "),
        const SizedBox(height: 5,),
        Text(provider.result,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),),
      ],
    );
  }
}