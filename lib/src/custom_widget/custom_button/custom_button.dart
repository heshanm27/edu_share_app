
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatelessWidget {
  final String BtnText;
  final IconData? BtnIcon;
  final bool? IconBtn;
  final Color? BtnColor;
  final VoidCallback onPressed;
  CustomButton({Key? key, required this.BtnText,this.BtnIcon,this.IconBtn, this.BtnColor, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return          SizedBox(
      width: 300.w,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide(color: BtnColor != null ? BtnColor! : Theme.of(context).primaryColor,)),
            backgroundColor: MaterialStateProperty.all(BtnColor != null ? BtnColor : Theme.of(context).primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)
                )
            ),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 15.h)),
            textStyle: MaterialStateProperty.all(TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.asset("assets/Google.png"),
            Text(BtnText),
            SizedBox(width : 20.w),
            IconBtn == true ? Icon(BtnIcon) :SizedBox() ,
          ],
        ),
      ),
    );
  }
}