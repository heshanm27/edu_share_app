import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors/colors.dart';

class CustomHeadlineText extends StatelessWidget {
  final String text;
  CustomHeadlineText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24.sp,
      color:Colors.black
    ),
    );
  }
}
