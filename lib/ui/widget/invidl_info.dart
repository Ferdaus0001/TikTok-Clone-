import 'package:flutter/material.dart';

class InvoiceInfoRow extends StatelessWidget {
  final String label;
  final List<String> values;

  const InvoiceInfoRow({
    super.key,
    required this.label,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF9F9FA1),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1.30,
          ),
        ),
        Row(
          children: values
              .map(
                (val) => Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                val,
                style: const TextStyle(
                  color: Color(0xFF1E1E20),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 1.30,
                ),
              ),
            ),
          )
              .toList(),
        ),
      ],
    );
  }
}
