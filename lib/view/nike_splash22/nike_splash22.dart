import 'package:flutter/material.dart';
import 'package:nike_project/Utilits/constants/colorConstants.dart';
import 'package:nike_project/view/nike_splash33/nike_splash33.dart';
import 'package:nike_project/widgets/linearindicator.dart';
import 'package:nike_project/widgets/whitebutton.dart';

class NikeSplash22 extends StatefulWidget {
  const NikeSplash22({super.key});

  @override
  State<NikeSplash22> createState() => _NikeSplash22State();
}

class _NikeSplash22State extends State<NikeSplash22> {
  String selectedCategory = '';

  Widget buildOption({
    required String imagePath,
    required String label,
  }) {
    final isSelected = selectedCategory == label;

    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      trailing: Radio<String>(
        value: label,
        groupValue: selectedCategory,
        onChanged: (value) {
          setState(() {
            selectedCategory = value!;
          });
        },
        activeColor: Colors.white,
        fillColor: MaterialStateProperty.all(Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/Group 784 (1).png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  linearindicator(value: 0.5),
                  const SizedBox(height: 20),

                  // Title
                  const Text(
                    "Which products do you use the most?",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Main Options
                  buildOption(
                      imagePath: 'assets/images/mens.png', label: "Men's"),
                      Divider(),
                  buildOption(
                      imagePath: 'assets/images/womens.png', label: "Women's"),

                  const SizedBox(height: 10),
                  const Text(
                    "Any others?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Extra Options
                  buildOption(
                      imagePath: 'assets/images/boys.png', label: "Boys'"),
                        Divider(),
                  buildOption(
                      imagePath: 'assets/images/girls.png', label: "Girls'"),

                  const Spacer(),

                  // Next Button
                  InkWell(
                    onTap: () {
                      if (selectedCategory.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NikeSplash33(),
                          ),
                        );
                      }
                    },
                    child: Center(child: whitebutton(text: "Next")),
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
