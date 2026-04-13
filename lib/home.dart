import 'package:flutter/material.dart';
import 'binary_to_octal.dart';
import 'octal_to_binary.dart';
import 'decimal_to_octal.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),

      // // 🔹 AppBar
      // appBar: AppBar(
      //       backgroundColor: Colors.transparent,
      //       elevation: 0,
      //       leading: const Icon(Icons.menu, color: Colors.black),
      //       actions: const [
      //              Padding(
      //               padding: EdgeInsets.only(right: 12),
      //               child: Icon(Icons.settings, color: Colors.black),
      //              )
      //                     ],
      //        ),

      // 🔹 Body
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔸 Title
              Center(
                child: const Text(
                  "Number System\n\t\t\t\t Calculator",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                "All Conversions & Operations in One Place",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              // 🔸 Conversions Section
              const Text(
                "Conversions",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.4,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BinaryToOctalScreen(),
                          ),
                        );
                      },
                      child: FeatureCard(
                        "Binary → Octal",
                        Icons.numbers_outlined,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OctalToBinaryScreen(),
                          ),
                        );
                      },
                      child: FeatureCard("Octal → Binary", Icons.swap_horiz),
                    ),
                    FeatureCard("Hex → Binary", Icons.code),
                    FeatureCard("Binary → Hex", Icons.code),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DecimalToOctalScreen(),
                          ),
                        );
                      },
                      child: FeatureCard("Decimal → Octal", Icons.calculate),
                    ),
                    FeatureCard("Octal → Decimal", Icons.calculate),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // 🔸 Operations Section
              const Text(
                "Operations",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Row(
                children: const [
                  Expanded(child: FeatureCard("Binary Addition", Icons.add)),
                  SizedBox(width: 12),
                  Expanded(
                    child: FeatureCard("Binary Subtraction", Icons.remove),
                  ),
                ],
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),

      // 🔹 Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Learn"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
        ],
      ),
    );
  }
}

// 🔹 Reusable Card Widget
class FeatureCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const FeatureCard(this.title, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade50,
            child: Icon(icon, color: Colors.blue),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
