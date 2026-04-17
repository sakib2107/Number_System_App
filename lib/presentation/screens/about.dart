import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
        
              /// 🔹 Profile Card
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage("assets/images/profile.jpg"),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Mohammad Sakib khan",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Computer Science Engineer\nMobile & Web Developer",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        
              const SizedBox(height: 16),
        
              /// 🔹 About Me Card
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.info_outline, color: Color(0xFF21BF73)),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "I am a passionate mobile and web developer with a strong background in backend development.",
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        
              const SizedBox(height: 16),
        
              /// 🔹 Project Purpose Card
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.school, color: Color(0xFF21BF73)),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "This Number System Calculator app is a voluntary and unpaid project created to help my students practice and solve ICT mathematics more efficiently.",
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        
              const SizedBox(height: 16),
        
              /// 🔹 Goal Card
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.flag_outlined, color: Color(0xFF21BF73)),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "My goal is to make learning simple, accessible, and effective for everyone.",
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        
              const SizedBox(height: 24),
        
              /// 🔹 Footer
              const Text(
                "Built with dedication by Sakib © 2026",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}