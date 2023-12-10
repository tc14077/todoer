part of 'booking_detail_widget.dart';

class DateTimePickerField extends StatelessWidget {
  DateTimePickerField({
    super.key,
    required this.onDateUpdate,
    required this.onTimeUpdate,
    required this.pickedDate,
    required this.pickedTime,
  })  : _dateController = TextEditingController(
            text: DateFormat('dd/MM/yyyy').format(pickedDate)),
        _timeController = TextEditingController(
            text: DateFormat('HH:mm').format(
                DateTime(0, 1, 1, pickedTime.hour, pickedTime.minute)));

  final TextEditingController _dateController;
  final TextEditingController _timeController;
  final Function(DateTime? date) onDateUpdate;
  final Function(TimeOfDay? time) onTimeUpdate;
  final DateTime pickedDate;
  final TimeOfDay pickedTime;
  final DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: TextField(
            controller: _dateController,
            decoration: const InputDecoration(
              labelText: 'Booking Date',
              suffixIcon: Icon(Icons.calendar_month),
            ),
            readOnly: true,
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: pickedDate,
                firstDate: today.subtract(const Duration(days: 1)),
                lastDate: today.add(const Duration(days: 365)),
                currentDate: today,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                initialDatePickerMode: DatePickerMode.day,
              );
              onDateUpdate(date);
            },
          ),
        ),
        const SizedBox.square(
          dimension: 8.0,
        ),
        Flexible(
          flex: 1,
          child: TextField(
            controller: _timeController,
            decoration: const InputDecoration(
              labelText: 'Booking Time',
              suffixIcon: Icon(Icons.alarm),
            ),
            readOnly: true,
            onTap: () async {
              final selectedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay(
                  hour: pickedTime.hour,
                  minute: pickedTime.minute,
                ),
                initialEntryMode: TimePickerEntryMode.inputOnly,
                builder: (BuildContext context, Widget? child) {
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(alwaysUse24HourFormat: true),
                    child: child!,
                  );
                },
              );
              onTimeUpdate(selectedTime);
            },
          ),
        ),
      ],
    );
  }
}
