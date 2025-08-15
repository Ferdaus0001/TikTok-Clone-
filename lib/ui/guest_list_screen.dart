import 'package:flutter/material.dart';
import 'package:music_app/ui/widget/attending_screen.dart';
import 'package:music_app/ui/widget/deciding_screen.dart';
import 'package:music_app/ui/widget/pending_guests_screen.dart';

class GuestListScreen extends StatefulWidget {
  const GuestListScreen({super.key});

  @override
  State<GuestListScreen> createState() => _GuestListScreenState();
}

class _GuestListScreenState extends State<GuestListScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text('Guest list'),
          bottom: const TabBar(
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            tabs: [
              Tab(text: 'Attending'),
              Tab(text: 'Deciding'),
              Tab(text: 'I wish i could'),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: const TabBarView(
          children: [
            AttendingScreen(),
            DecidingScreen(),
            PendingGuestsScreen(),

          ],
        ),
      ),
    );
  }
}
