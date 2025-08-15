import 'package:flutter/material.dart';

class BookingEventHall extends StatefulWidget {
  const BookingEventHall({super.key});

  @override
  State<BookingEventHall> createState() => _BookingEventHallState();
}

class _BookingEventHallState extends State<BookingEventHall> {
  int paxCount = 0;

  Widget _iconButton() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD0D0D0)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: const SizedBox(width: 16, height: 16),
    );
  }

  Widget _pillButton(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'Archivo',
        ),
      ),
    );
  }

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
        child: SingleChildScrollView(
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
                        const Expanded(
                          child: Text(
                            'Chicago Marriott Southwest at Burr Ridge',
                            style: TextStyle(
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
                    const Divider(),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pax',
                      style: TextStyle(
                        color: Color(0xFF060A0F),
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
                          children: const [
                            Text(
                              '\$600.00',
                              style: TextStyle(
                                color: Color(0xFF0B0B0B),
                                fontSize: 16,
                                fontFamily: 'Archivo',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              '/ Pax',
                              style: TextStyle(
                                color: Color(0xFF8C9096),
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
                                child: const Icon(Icons.remove,
                                    size: 16, color: Colors.black),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              '$paxCount',
                              style: const TextStyle(
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
                                child: const Icon(Icons.add,
                                    size: 16, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F8FA),
                  border: Border.all(color: const Color(0xFFDFE1E6)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Write a message...',
                        hintStyle: const TextStyle(
                          color: Color(0xFF6F6F6F),
                          fontSize: 12,
                          fontFamily: 'Archivo',
                        ),
                        border: InputBorder.none,
                      ),
                      maxLines: 3, // চাইলে সংখ্যা বাড়াতে পারো
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            _iconButton(),
                            const SizedBox(width: 8),
                            _iconButton(),
                          ],
                        ),
                        Row(
                          children: [
                            _pillButton('Custom your package', const Color(0xFFC59E00)),
                            const SizedBox(width: 8),
                            _pillButton('Send', const Color(0xFF0B0B0B)),
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
      ),
    );
  }
}
