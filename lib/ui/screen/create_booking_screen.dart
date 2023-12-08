import 'package:flutter/material.dart';

import '../system/themed_text.dart';

class CreateBookingScreen extends StatelessWidget {
  const CreateBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme setting'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleLargeText('CreateBooking'),
          ],
        ),
      ),
    );
  }
}
