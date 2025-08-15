import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_app/ui/booking_event_hall.dart';

import 'package:music_app/ui/event_Invitation_screen.dart';

import 'screen/hive_modle.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(PDFPageAdapter());
  await Hive.openBox<PDFPage>('pdf_pages');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BookingEventHall(),
    );
  }
}
