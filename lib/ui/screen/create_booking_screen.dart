import 'package:flutter/material.dart';
import 'package:todoer/ui/widget/create_booking_widget.dart';

import '../system/themed_text.dart';

class CreateBookingScreen extends StatelessWidget {
  const CreateBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Booking'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CreateBookingWidget(
          defaultBookingTime: DateTime.now(),
        ),
      ),
    );
  }
}
