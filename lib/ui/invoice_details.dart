import 'package:flutter/material.dart';
import 'package:music_app/ui/widget/invidl_info.dart';

class InvoiceDetailsScreen extends StatefulWidget {
  const InvoiceDetailsScreen({super.key});

  @override
  State<InvoiceDetailsScreen> createState() => _InvoiceDetailsScreenState();
}

class _InvoiceDetailsScreenState extends State<InvoiceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Icon(Icons.upload),
          SizedBox(width: 6,),
        ],

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.grey.shade100,
                ),
                child: Column(
                    children: [
                      CsotmDivider(),
                      Padding(
                        padding:   EdgeInsets.symmetric(horizontal: 12,vertical: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomRow(),
                            SizedBox(height: 24,),
                        InvoiceInfoRow(
                          label: 'Issued Date',
                          values: ['2029/02/16', '2029/02/16'],
                        ),
                              SizedBox(height: 5,),
                              InvoiceInfoRow(
                          label: 'Issued Date',
                          values: ['2029/02/16', '2029/02/16'],
                        ),
                            SizedBox(height: 8,),
          
          
                            Text(
                              'Bill From',
                              style: TextStyle(
                                color: const Color(0xFF9F9FA1),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 1.30,
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              'Event Management Co.',
                              style: TextStyle(
                                color: const Color(0xFF1E1E20),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 1.20,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              '123 Sunset Avenue, Los Angeles, CA, 90001',
                              style: TextStyle(
                                color: const Color(0xFF9F9FA1),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 1.30,
                              ),
                            ),
                            SizedBox(height: 3,),
                            Text(
                              'billing@eventmgmt.com',
                              style: TextStyle(
                                color: const Color(0xFF9F9FA1),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 1.30,
                              ),
                            ),
                            SizedBox(height: 3,),
                            Text(
                              '+1-800-555-1234',
                              style: TextStyle(
                                color: const Color(0xFF9F9FA1),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 1.30,
                              ),
                            ),
                            SizedBox(height: 24,),
                            Text(
                              'Bill To',
                              style: TextStyle(
                                color: const Color(0xFF9F9FA1),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 1.30,
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              'Alicia Smithson',
                              style: TextStyle(
                                color: const Color(0xFF1E1E20),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 1.20,
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              '789 Main Street, Beverly Hills, CA, 90210',
                              style: TextStyle(
                                color: const Color(0xFF9F9FA1),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 1.30,
                              ),
                            ),
                           SizedBox(height: 3,),
                            Text(
                              'alicia.smithson@email.com',
                              style: TextStyle(
                                color: const Color(0xFF9F9FA1),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 1.30,
                              ),
                            ),
                            SizedBox(height: 3,),
                            Text(
                              '+1-310-555-6789',
                              style: TextStyle(
                                color: const Color(0xFF9F9FA1),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 1.30,
                              ),
                            ),
                           SizedBox(height: 26,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 6,vertical: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                border: Border.all(color: Colors.grey.shade300,width: 1,),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ticket Details',
                                    style: TextStyle(
                                      color: const Color(0xFF1E1E20),
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      height: 1.25,
                                    ),
                                  ),
                                   SizedBox(height: 16,),
                                  CategoryWidget(),
                                  SizedBox(height: 11,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Platinum',
                                        style: TextStyle(
                                          color: const Color(0xFF1E1E20),
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 1.30,
                                        ),
                                      ),
          // -
                                      Text(
                                        '1 x \$120',
                                        style: TextStyle(
                                          color: const Color(0xFF1E1E20),
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 1.30,
                                        ),
                                      ),
          // ---
                                      Text(
                                        '\$120',
                                        style: TextStyle(
                                          color: const Color(0xFF1E1E20),
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 1.30,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  SizedBox(height: 8,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Silver',
                                        style: TextStyle(
                                          color: const Color(0xFF1E1E20),
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 1.30,
                                        ),
                                      ),
          // -
                                      Text(
                                        '1 x \$120',
                                        style: TextStyle(
                                          color: const Color(0xFF1E1E20),
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 1.30,
                                        ),
                                      ),
          // ---
                                      Text(
                                        '\$120',
                                        style: TextStyle(
                                          color: const Color(0xFF1E1E20),
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 1.30,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  SizedBox(height: 8,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Sub Total',
                                        style: TextStyle(
                                          color: const Color(0xFF1E1E20),
                                          fontSize: 11,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 1.35,
                                        ),
                                      ),
                                      // ---
                                      Text(
                                        '\$220',
                                        style: TextStyle(
                                          color: const Color(0xFF1E1E20),
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          height: 1.30,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  SizedBox(height: 8,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Tax (10%)',
                                        style: TextStyle(
                                          color: const Color(0xFF1E1E20),
                                          fontSize: 11,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          height: 1.35,
                                        ),
                                      ),
                                      // ---
                                      Text(
                                        '\$20',
                                        style: TextStyle(
                                          color: const Color(0xFF1E1E20),
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          height: 1.30,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 18,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total',
                                        style: TextStyle(
                                          color: const Color(0xFF1E1E20),
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          height: 1.30,
                                        ),
                                      ),
          // ---
                                      Text(
                                        '\$247',
                                        style: TextStyle(
                                          color: const Color(0xFF1E1E20),
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          height: 1.30,
                                        ),
                                      )
                                    ],
                                  ),
                                  
                                  ]
                              ),
                            ),
                              SizedBox(height: 25,),
                            Text(
                              'Note',
                              style: TextStyle(
                                color: const Color(0xFF9F9FA1),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 1.30,
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Please make payment before the due date to avoid any penalties or cancellation of your ticket. For any questions or concerns, contact our support team at ',
                                    style: TextStyle(
                                      color: const Color(0xFF434345),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 1.30,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'support@eventmgmt.com',
                                    style: TextStyle(
                                      color: const Color(0xFF434345),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline,
                                      height: 1.30,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' or call +1-800-555-1234.',
                                    style: TextStyle(
                                      color: const Color(0xFF434345),
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 1.30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
          
                          ],
                        ),
                      )
                    ]),
              ),
              SizedBox(height: 26,),
              
              Row(
                spacing: 11,
                children: [
                  Expanded(child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFEDEEEF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Text(
                          'Cancel',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF252525),
                            fontSize: 14,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w500,
                            height: 1.32,
                            letterSpacing: 0.03,
                            shadows: [Shadow(offset: Offset(4, 8), blurRadius: 24, color: Color(0xFF584CF4).withOpacity(0.25))],
                          ),
                        ),
                      ],
                    ),
                  )),
                  Expanded(child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF0B0B0B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F0B0B0B),
                          blurRadius: 25,
                          offset: Offset(4, 8),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Text(
                          'Pay',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w500,
                            height: 1.32,
                            letterSpacing: 0.03,
                            shadows: [Shadow(offset: Offset(4, 8), blurRadius: 24, color: Color(0xFF584CF4).withOpacity(0.25))],
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
              SizedBox(height: 26,),
            ],
          ),
        ),
      ),
    );
  }
}
























class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: ShapeDecoration(
        color: const Color(0xFFE7E5E5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 24,
        children: [
          Container(
            width: 98,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Ticket Category',
                  style: TextStyle(
                    color: const Color(0xFF777779),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 1.24,
                  ),
                ),
                Container(width: 14, height: 14, child: Stack()),
              ],
            ),
          ),
          Container(
            width: 62,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Price',
                  style: TextStyle(
                    color: const Color(0xFF777779),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 1.24,
                  ),
                ),
                Container(width: 14, height: 14, child: Stack()),
              ],
            ),
          ),
          Container(
            width: 55,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Amount',
                  style: TextStyle(
                    color: const Color(0xFF777779),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 1.24,
                  ),
                ),
                Container(width: 14, height: 14, child: Stack()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
















class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              '#',
              style: TextStyle(
                color: const Color(0xFFB0B1BD),
                fontSize: 26,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 1.10,
              ),
            ),
            Text(
              'INV10012',
              style: TextStyle(
                color: const Color(0xFF0B0B0B),
                fontSize: 26,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 1.10,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(top: 4, left: 5, right: 8, bottom: 4),
          decoration: ShapeDecoration(
            color: const Color(0x4FEF4444),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 3,
            children: [
              Icon(Icons.account_balance_wallet_outlined),
              Text(
                'Unpaid',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: const Color(0xFFEF4444),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.30,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}





















class CsotmDivider extends StatelessWidget {
  const CsotmDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 10,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.only(topLeft: Radius.circular(11),topRight: Radius.circular(11)),
        color: Colors.black,
      ),
    );
  }
}
