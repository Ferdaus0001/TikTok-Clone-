import 'package:flutter/material.dart';

class EventInvitationScreen extends StatefulWidget {
  const EventInvitationScreen({super.key});

  @override
  State<EventInvitationScreen> createState() => _EventInvitationScreenState();
}

class _EventInvitationScreenState extends State<EventInvitationScreen> {
  String? groupValue;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Event Invitation'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade100,
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200, // fixed height
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://wallpapercave.com/wp/wp2596952.jpg',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Text(
                            'You’ve been invited as a special guest to [HOST NAME]’s event!',
                            style: TextStyle(
                              color: const Color(0xFF060A0F),
                              fontSize: 16,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w600,
                              height: 1.20,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Please let us know if you’ll be attending — your presence will truly make the celebration brighter!\n'
                            'And don’t forget to leave a heartfelt message of congratulations. Hooray will instantly deliver your warm wishes directly to the host.',
                            style: TextStyle(
                              color: Color(0xFF8C9096),
                              fontSize: 14,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w400,
                              height: 1.40,
                            ),
                          ),
                          SizedBox(height: 24),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1.4,
                                child: Radio<String>(
                                  // fillColor: Colors.black,
                                  activeColor: Colors.black,
                                  value: 'attending',
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue = value;
                                    });
                                  },
                                ),
                              ),
                              const Text(
                                'I am attending',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF122234),
                                  fontSize: 14,
                                  fontFamily: 'Archivo',
                                  fontWeight: FontWeight.w400,
                                  height: 1.43,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8,),
                          TextFormField(
                            maxLines: 5,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: 'Send your heartly message ',
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none,
                              )
                            ),
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          
              SizedBox(height: 60),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: const Color(0xFF0B0B0B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x280B0B0B),
                      blurRadius: 25,
                      offset: Offset(4, 8),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Submit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w500,
                        height: 1.32,
                        letterSpacing: 0.03,
                        shadows: [
                          Shadow(
                            offset: const Offset(4, 8),
                            blurRadius: 24,
                            color: const Color(0xFF584CF4).withOpacity(0.25),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
