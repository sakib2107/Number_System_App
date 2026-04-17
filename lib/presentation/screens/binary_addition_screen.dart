import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/binary_addition_provider.dart';

class BinaryAdditionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BinaryStateProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xffF5F7FB),
      body: Column(
        children: [
          // 🔵 Header (same as before)
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 60, bottom: 25),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff4A90E2), Color(0xff357ABD)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                Text("Binary Addition",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                Text("Add two Binary numbers",
                    style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),

          SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                buildInput("Enter First Binary Number",
                        (val) => provider.setFirst(val)),
                SizedBox(height: 12),
                buildInput("Enter Second Binary Number",
                        (val) => provider.setSecond(val)),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: provider.calculate,
                  child: Text("Add"),
                ),

                SizedBox(height: 20),

                if (provider.result.isNotEmpty)
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(provider.result,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        Text("Binary Result"),
                      ],
                    ),
                  ),

                SizedBox(height: 15),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          // copy logic
                        },
                        child: Text("Copy"),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: provider.reset,
                        child: Text("Reset"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildInput(String hint, Function(String) onChanged) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
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