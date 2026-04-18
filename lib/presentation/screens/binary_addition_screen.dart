import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/binary_addition_provider.dart';

class BinaryAdditionScreen extends StatefulWidget {
  const BinaryAdditionScreen({super.key});

  @override
  State<BinaryAdditionScreen> createState() =>
      _BinaryAdditionScreenState();
}

class _BinaryAdditionScreenState extends State<BinaryAdditionScreen> {
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BinaryStateProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      body: Column(
        children: [
          // 🔵 Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, bottom: 25),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff4A90E2), Color(0xff357ABD)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: const Column(
              children: [
                Text(
                  "Binary Addition",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                Text(
                  "Add two Binary numbers",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                buildInput(
                  controller: firstController,
                  hint: "Enter First Binary Number",
                  onChanged: (val) => provider.setFirst(val),
                ),
                const SizedBox(height: 12),

                buildInput(
                  controller: secondController,
                  hint: "Enter Second Binary Number",
                  onChanged: (val) => provider.setSecond(val),
                ),

                const SizedBox(height: 20),

                // 🔵 Calculate Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding:
                      const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      provider.BinaryAdd();
                    },
                    child: const Text(
                      "Convert",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 🔵 Result Box
                if (provider.result.isNotEmpty)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          provider.result,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text("Binary Result"),
                      ],
                    ),
                  ),

                const SizedBox(height: 20),

                // 🔵 Buttons Row
                Row(
                  children: [
                    // 🔙 Back Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Back"),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // 🔄 Reset Button
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          firstController.clear();
                          secondController.clear();
                          provider.reset();
                        },
                        child: const Text("Reset"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔵 Input Field Widget
  Widget buildInput({
    required TextEditingController controller,
    required String hint,
    required Function(String) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}