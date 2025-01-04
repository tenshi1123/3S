import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/utils/constants/color.dart';
import 'package:three_s/utils/constants/styles.dart';

Widget homeTab(
    {required String title,
    bool isSeprator = true,
    bool hasNumber = true,
    int count = 0}) {
  return Tab(
    child: Container(
      //width: 70.w,
      height: 50.h,
      decoration: isSeprator
          ? const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.grey,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
            )
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 3.w,
          ),
          SizedBox(
            width: 77.w,
            child: Center(
              child: Text(
                title,
              ),
            ),
          ),
          hasNumber
              ? Container(
                  decoration: BoxDecoration(
                    color: primary600,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ),
                  height: 20.h,
                  padding: EdgeInsets.symmetric(horizontal: 4.h),
                  child: Center(
                    child: Text(
                      '10',
                      style: defaultText14.copyWith(color: Colors.white),
                    ),
                  ),
                )
              : SizedBox(
                  width: 10.w,
                ),
        ],
      ),
    ),
  );
}

class UnorderedList extends StatelessWidget {
  const UnorderedList(this.texts, {super.key, required this.icon});
  final List<String> texts;
  final int icon;
  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts) {
      // Add list item
      widgetList.add(UnorderedListItem(
        text,
        icon: icon,
      ));
      // Add space between items
      widgetList.add(const SizedBox(height: 5.0));
    }

    return Column(children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem(this.text, {super.key, required this.icon});
  final String text;
  final int icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "• ",
          style: defaultText14,
        ),
        Expanded(
          child: Text(
            text,
            style: defaultText14,
          ),
        ),
        (icon == 1)
            ? const Icon(
                Icons.done,
                color: Colors.green,
              )
            : const SizedBox()
      ],
    );
  }
}

Future<void> commingSoonDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Comming soon',
          style: defaultText14,
        ),
        content: Text(
          'Chức năng đang phát triển',
          style: defaultText14,
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
