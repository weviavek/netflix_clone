import 'package:flutter/material.dart';

import '../../../core/appbar_text_style.dart';
import '../../../core/colors.dart';
import '../../../domain/core/month_finder.dart';

class DateBox extends StatelessWidget {
  final String date;
  const DateBox({super.key,required this.date});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Text(
            findMonth(date.split('-')[1]),
            style: defaultTextStyle.copyWith(fontSize: 25, color: kColorGray),
          ),
          Text(
            date.split('-').last,
            style: defaultTextStyle.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
