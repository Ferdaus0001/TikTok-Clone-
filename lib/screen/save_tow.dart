import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'hive_modle.dart';

class SavePageLogicScreenTow extends StatelessWidget {
    SavePageLogicScreenTow({super.key});

  final PDFPage indiaPage = PDFPage(
    pageTitle: "What is India",
    pageContent: """
India is a country in South Asia. Here are some key points:

Location: It is located west of Bangladesh.

Capital: New Delhi

Official Language: Hindi, English

Population: Over 1.4 billion people

Government: Federal parliamentary constitutional republic

Currency: Indian Rupee (INR)

Culture: Known for rich traditions in music, literature, art, and cuisine. Famous for Taj Mahal and Bollywood.

In short, India is a culturally diverse country with a growing economy.
""",
  );

  Future<void> saveIndiaPage(BuildContext context) async {
    var box = Hive.box<PDFPage>('pdf_pages');

    // India page save হবে Hive-এ
    await box.add(indiaPage);

    // User কে snackbar দিয়ে জানাবে
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("India page saved successfully!")),
    );

    log("India page saved to Hive.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("India Info"),
        actions: [
          IconButton(
            onPressed: () => saveIndiaPage(context),
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.all(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  indiaPage.pageTitle,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Divider(),
                const SizedBox(height: 8),
                Text(
                  indiaPage.pageContent,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 12),
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange),
                    Icon(Icons.star, color: Colors.orange),
                    Icon(Icons.star, color: Colors.orange),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
