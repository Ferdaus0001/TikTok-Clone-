import 'dart:developer'; // ✅ log() এর জন্য
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'hive_modle.dart';

class SavePageLogicScreenone extends StatelessWidget {
  SavePageLogicScreenone({super.key});

  // Custom pages with styled content
  final List<PDFPage> pages = [
    PDFPage(
      pageTitle: "What is Bangladesh",
      pageContent: """
Bangladesh is a country in South Asia. Here are some key points:

Location: It is located on the eastern side of India, with a small border with Myanmar to the southeast, and the Bay of Bengal to the south.

Capital: Dhaka

Official Language: Bangla (Bengali)

Population: Over 170 million people

Government: Parliamentary democracy

Currency: Bangladeshi Taka (BDT)

Culture: Known for rich traditions in music, literature, art, and cuisine. Famous for the Sundarbans (largest mangrove forest) and the Royal Bengal Tiger.

In short, Bangladesh is a densely populated country with a rich cultural heritage and a developing economy.
""",
    ),



  ];

  Future<void> savePages() async {
    var box = Hive.box<PDFPage>('pdf_pages');

    for (var page in pages) {
      await box.add(page);
      log("Saved page: ${page.pageTitle}"); // ✅ log for each page
    }

    log("All pages saved. Total: ${pages.length}"); // ✅ summary log
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Pages"),
        actions: [
          IconButton(
            onPressed: () async {
              await savePages(); // Hive box-এ page save করবে
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Pages saved successfully!")), // ইউজারকে জানাবে
              );
              log("Save button pressed, Hive updated."); // Console log করবে
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          final page = pages[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    page.pageTitle,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  const SizedBox(height: 8),
                  Text(
                    page.pageContent,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.orange),
                      Icon(Icons.star, color: Colors.orange),
                      Icon(Icons.star, color: Colors.orange),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
