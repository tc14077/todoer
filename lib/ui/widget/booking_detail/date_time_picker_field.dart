part of 'booking_detail_widget.dart';

class DateTimePickerField extends StatefulWidget {
  const DateTimePickerField({
    super.key,
    required this.onDateUpdate,
    required this.onTimeUpdate,
    required this.pickedDate,
    required this.pickedTime,
  });

  final Function(DateTime? date) onDateUpdate;
  final Function(TimeOfDay? time) onTimeUpdate;
  final DateTime pickedDate;
  final TimeOfDay pickedTime;

  @override
  State<DateTimePickerField> createState() => _DateTimePickerFieldState();
}

class _DateTimePickerFieldState extends State<DateTimePickerField> {
  final DateTime today = DateTime.now();
  late final TextEditingController _dateController;
  late final TextEditingController _timeController;
  final _dateFieldKey = UniqueKey();
  final _timeFieldKey = UniqueKey();

  @override
  void initState() {
    _dateController = TextEditingController(
        text: DateFormat('dd/MM/yyyy').format(
      widget.pickedDate,
    ));
    _timeController = TextEditingController(
        text: DateFormat('HH:mm').format(DateTime(
      0,
      1,
      1,
      widget.pickedTime.hour,
      widget.pickedTime.minute,
    )));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DateTimePickerField oldWidget) {
    _dateController.text = DateFormat('dd/MM/yyyy').format(
      widget.pickedDate,
    );
    _timeController.text = DateFormat('HH:mm').format(DateTime(
      0,
      1,
      1,
      widget.pickedTime.hour,
      widget.pickedTime.minute,
    ));
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: TextField(
            key: _dateFieldKey,
            controller: _dateController,
            decoration: const InputDecoration(
              labelText: 'Booking Date',
              suffixIcon: Icon(Icons.calendar_month),
            ),
            readOnly: true,
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: widget.pickedDate,
                firstDate: today.subtract(const Duration(days: 1)),
                lastDate: today.add(const Duration(days: 365)),
                currentDate: widget.pickedDate,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                initialDatePickerMode: DatePickerMode.day,
              );
              widget.onDateUpdate(date);
            },
          ),
        ),
        const SizedBox.square(
          dimension: 8.0,
        ),
        Flexible(
          flex: 1,
          child: TextField(
            key: _timeFieldKey,
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
                  hour: widget.pickedTime.hour,
                  minute: widget.pickedTime.minute,
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
              widget.onTimeUpdate(selectedTime);
            },
          ),
        ),
      ],
    );
  }
}
