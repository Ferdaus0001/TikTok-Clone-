import 'package:flutter/material.dart';

class PendingGuestsScreen extends StatelessWidget {
  const PendingGuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16, ),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 11,
            itemBuilder: (context,index){
              return
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 16),
                  child: GuestMessageCard(
                    name: 'Dianne Russell',
                    message:
                    'I’m so excited to join you on this special day! Thank you for the invitation — I wouldn’t miss it for the world. Wishing you endless joy and unforgettable memories. See you soon!',
                  ),
                );
            })



    );
  }
}

class GuestMessageCard extends StatelessWidget {
  final String name;
  final String message;

  const GuestMessageCard({
    super.key,
    required this.name,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: const Color(0xFFF6F8FA),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFDFE1E6)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const CircleAvatar(),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            message,
            style: const TextStyle(
              color: Color(0xFF666D80),
              fontSize: 14,
              fontFamily: 'Archivo',
              fontWeight: FontWeight.w400,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}
