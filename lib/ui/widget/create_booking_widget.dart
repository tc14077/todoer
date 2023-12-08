import 'package:flutter/material.dart';
import 'package:todoer/ui/system/themed_text.dart';

class CreateBookingWidget extends StatelessWidget {
  CreateBookingWidget({
    super.key,
  });

  final TextEditingController _eventNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ElevatedButton(
    //       child: const BodyMediumText('Cancel'),
    //       onPressed: () {
    //         Navigator.pop(context);
    //       },
    //     ),
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _eventNameController,
          decoration: InputDecoration(
            labelText: 'Booking Name',
          ),
        ),
        TextField(
          controller: _eventNameController,
          decoration: InputDecoration(
            labelText: 'Remark (Optional)',
          ),
        ),
      ],
    );
  }
}
