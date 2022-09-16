import 'package:edu_share_app/src/constants/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String BtnText;
  final IconData? BtnIcon;
  final bool? IconBtn;
  final Color? BtnColor;
  final VoidCallback onPressed;

  CustomButton(
      {Key? key,
      required this.BtnText,
      this.BtnIcon,
      this.IconBtn,
      this.BtnColor = tPrimaryColor,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label:Text(BtnText) ,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(5.h),
          minimumSize: Size.fromHeight(45.h),
          textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          backgroundColor: BtnColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0.r),
              side: BorderSide(color: BtnColor!))),
      icon: IconBtn == true ? Icon(BtnIcon) : SizedBox(),
    );
  }
}
