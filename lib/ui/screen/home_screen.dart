import 'package:flutter/material.dart';
import 'package:todoer/ui/system/themed_text.dart';

import '../widget/table_calendar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plannable Booking'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                final widgetWidth = context.size?.width;
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Basic dialog title'),
                      content: SizedBox(
                        width: widgetWidth!,
                        child: TableCalendarWidget(
                          focusedDay: DateTime.now(),
                          onDaySelected: (day) {},
                        ),
                      ),
                      actions: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            textStyle: const TextStyle(fontSize: 15),
                          ),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Gradient'),
            ),
          ],
        ),
      ),
    );
  }
}
