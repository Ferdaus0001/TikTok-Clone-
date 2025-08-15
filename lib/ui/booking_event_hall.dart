import 'package:flutter/material.dart';

class BookingEventHall extends StatefulWidget {
  const BookingEventHall({super.key});

  @override
  State<BookingEventHall> createState() => _BookingEventHallState();
}

class _BookingEventHallState extends State<BookingEventHall> {
  int paxCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Booking Event Hall',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Slot VVIP',
              style: TextStyle(
                color: Color(0xFF060A0F),
                fontSize: 16,
                fontFamily: 'Archivo',
                fontWeight: FontWeight.w500,
                height: 1.20,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Base price + fee 10% + Admin fee 5%',
              style: TextStyle(
                color: Color(0xFF8C9096),
                fontSize: 14,
                fontFamily: 'Archivo',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: Colors.grey.shade100,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://wallpapercave.com/wp/wp2596952.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Chicago Marriott Southwest at Burr Ridge',
                          style: const TextStyle(
                            color: Color(0xFF060A0F),
                            fontSize: 16,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w500,
                            height: 1.20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),


                ],
              ),
            ),
            SizedBox(height: 30,),
       Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6F7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pax',
            style: TextStyle(
              color: const Color(0xFF060A0F),
              fontSize: 16,
              fontFamily: 'Archivo',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '\$600.00',
                    style: TextStyle(
                      color: const Color(0xFF0B0B0B),
                      fontSize: 16,
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '/ Pax',
                    style: TextStyle(
                      color: const Color(0xFF8C9096),
                      fontSize: 12,
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (paxCount > 1) {
                        setState(() => paxCount--);
                      }
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE8E8EA),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.remove, size: 16, color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    '$paxCount',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() => paxCount++);
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: Color(0xFF0B0B0B),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add, size: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
          ],
        ),
      ),
    );
  }
}
