import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  final String header;
  final String value;
  
  const ProfileSection({super.key, required this.header, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20
          ),
        )
      ],
    );
  }
}