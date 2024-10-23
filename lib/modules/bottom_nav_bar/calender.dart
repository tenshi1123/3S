import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _NewWidgetExampleState();
}

class _NewWidgetExampleState extends State<Calender> {
  final _now = DateTime.now();
  DateTime _selectedDate = DateTime.now();
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();
  @override
  void initState() {
    super.initState();
  }

// do not forget to dispose the controller
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 40.h,
        ),
        EasyInfiniteDateTimeLine(
          controller: _controller,
          firstDate: DateTime(2024, 3, 18),
          lastDate: DateTime(2030, 3, 18),
          locale: "vi",
          onDateChange: (selectedDate) {
            setState(() {
              _selectedDate = selectedDate;
            });
          },
          focusDate: _selectedDate,
        ),
        const SizedBox(height: 32.0),
        ElevatedButton(
          onPressed: () {
            _controller.animateToDate(DateTime.now());
          },
          child: const Text('Đến ngày hôm nay'),
        ),
        ElevatedButton(
          onPressed: () {
            _controller.animateToDate(DateTime(_now.year + 1, 6, 5));
          },
          child: Text('Chuyển đến ${_now.year + 1}-6-5 '),
        ),
      ],
    );
  }
}
