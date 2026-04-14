import 'package:flutter/material.dart';
import '../widgets/back_button.dart';
import '../widgets/reset_button.dart';
import '../provider/converter_provider.dart';
import 'package:provider/provider.dart';

class BinaryToOctalScreen extends StatelessWidget {
  BinaryToOctalScreen({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NumberSystemProvider>(context);
    return Scaffold(
      // 🔹 AppBar (Blue Header)
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: Colors.blue,
        title: Center(
          child: Column(
           children: [
             const Text("Binary → Octal",
             style: TextStyle(
               color: Colors.white
             ),),
             const SizedBox(height: 10),
             const Text("Convert Binary Number to Octal",
               style: TextStyle(
                   color: Colors.white,
                   fontSize: 15
               ),),
           ]),
        ),
           shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // 👈 rounded bottom
          ),
        ),
      ),

      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔸 Subtitle
              // const Center(
              //   child: Text(
              //     "Convert Binary number to Octal",
              //     style: TextStyle(color: Colors.grey),
              //   ),
              // ),
        
              const SizedBox(height: 10),
        
              // 🔹 Input Label
              const Text(
                "Enter Binary Number",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
        
              const SizedBox(height: 10),
        
              // 🔹 Input Field
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "10110101",
                  filled: true,
                  fillColor: const Color(0xFFF2F3F7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: const Icon(Icons.close),
                ),
              ),
        
              const SizedBox(height: 6),
        
              const Text(
                "(Allowed digits: 0, 1)",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
        
              const SizedBox(height: 16),
        
              // 🔹 Convert Button + Swap Icon
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed:()
                           {
                        provider.binaryToOctal(controller.text);
                      },
                      child: const Text("Convert",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F3F7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(Icons.swap_horiz),
                  )
                ],
              ),
        
              const SizedBox(height: 24),
        
              // 🔹 Result Title
              const Text(
                "Result",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
        
              const SizedBox(height: 10),
        
              // 🔹 Result Box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F3F7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text("Result: ${provider.result}"),
                    Text(
                      "Octal Equivalent",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 16),
        
              // 🔹 How it works
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF2FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.lightbulb, color: Colors.blue),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Group binary digits in 3 from right to left, then convert each group to octal.",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
        
              SizedBox(height: 20,),

              //  Bottom Buttons
              Row(
                children: [
                  CustomBackButton(),
                  const SizedBox(width: 12),
                  ResetButton(controller: controller, provider: provider),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}