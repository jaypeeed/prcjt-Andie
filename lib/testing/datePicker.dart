import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  TimeOfDay time = TimeOfDay.now();
  DateTime date = DateTime.now();

  String getDate() {
    if (date == null) {
      return 'Select Date';
    } else {
      final months = date.month.toString().padLeft(2, '0');
      final days = date.day.toString().padLeft(2, '0');
      final years = date.year.toString();

      return '$months/$days/$years';
    }
  }

  String getTime() {
    if (date == null) {
      return 'Select Date';
    } else {
      final hours = time.hour.toString().padLeft(2, '0');
      final minutes = time.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  TextEditingController dateController = new TextEditingController();
  TextEditingController timeController = new TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const Text('Date'),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () => pickDate(context),
              child: Text(getDate()),
            ),
          ),
          const Text('Time:'),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () => pickTime(context),
              child: Text(getTime()),
            ),
          ),
        ],
      )),
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;

    setState(() => date = newDate);
  }

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay.now();
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => time = newTime);
  }
}
