import 'package:flutter/material.dart';
import '../widgets/back_button.dart';
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
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: Colors.blue,
        title: Center(
          child: Column(
            children: [
              const Text("Binary Addition", style: TextStyle(color: Colors.white)),
              const SizedBox(height: 10),
              const Text(
                "Add Two Binary Number",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      backgroundColor: const Color(0xffF5F7FB),
      body: Column(
        children: [

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
               // if (provider.result.isNotEmpty)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const Text("Binary Result"),
                        Text(
                          provider.result,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 20),

                // 🔵 Buttons Row
                Row(
                  children: [
                    CustomBackButton(),

                    const SizedBox(width: 12),


                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          firstController.clear();
                          secondController.clear();
                          provider.reset();
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text("Reset"),
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