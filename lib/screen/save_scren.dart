import 'dart:developer'; // log() এর জন্য
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'hive_modle.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  late Box<PDFPage> box;

  @override
  void initState() {
    super.initState();
    box = Hive.box<PDFPage>('pdf_pages');
    log("Hive box opened. Total saved pages: ${box.length}");
  }

  void deleteAll() async {
    await box.clear();
    setState(() {});
    log("All pages deleted. Box length: ${box.length}");
  }

  void deletePage(int index) async {
    final removedPage = box.getAt(index);
    await box.deleteAt(index);
    setState(() {});
    log("Deleted page: ${removedPage?.pageTitle ?? 'Unknown'} at index $index");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Pages"),
        actions: [
          IconButton(
            onPressed: box.isEmpty ? null : deleteAll,
            icon: const Icon(Icons.delete),
            color: Colors.red,
          )
        ],
      ),
      body: box.isEmpty
          ? const Center(child: Text("No saved pages"))
          : ListView.builder(
        itemCount: box.length,
        itemBuilder: (context, index) {
          final page = box.getAt(index);
          return Card(
            margin: const EdgeInsets.all(8),
            elevation: 14,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deletePage(index),
                    ),
                  ],
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  title: Text(
                    page?.pageTitle ?? '',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      page?.pageContent ?? '',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),

                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
