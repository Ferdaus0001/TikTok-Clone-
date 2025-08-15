import 'package:flutter/material.dart';
import 'package:music_app/screen/save_page_logic.dart';
import 'package:music_app/screen/save_tow.dart';
import 'save_scren.dart';


class Navbarscren extends StatefulWidget {
  const Navbarscren({super.key});

  @override
  State<Navbarscren> createState() => _NavbarscrenState();
}

class _NavbarscrenState extends State<Navbarscren> {
  int selectedIndex = 0; // declare selectedIndex

  // Screens for each tab
  final List<Widget> screens = [
    SavePageLogicScreenone(), // Home tab
    SavePageLogicScreenTow(),// Saved tab
    SaveScreen(),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.save_as_outlined), label: 'Savedtwo'),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: 'Saved'),

        ],
      ),
    );
  }
}
