import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSnackBars{
   static GlobalKey<ScaffoldMessengerState> messengerKey  = GlobalKey<ScaffoldMessengerState>();
static showErrorSnackBar(String? text){
  final snackBar =  SnackBar(content:Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.error_outline),
        SizedBox(width:16.w),
        Expanded(child: Text(text!))
      ],
    ),
  backgroundColor: Colors.red,
  );
  messengerKey.currentState!..removeCurrentSnackBar()..showSnackBar(snackBar);
}

   static showSuccessSnackBar(String? text){
     final snackBar =  SnackBar(content:Row(
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Icon(Icons.done),
         SizedBox(width:16.w),
         Expanded(child: Text(text!))
       ],
     ),
       backgroundColor: Colors.green
     );
     messengerKey.currentState!..removeCurrentSnackBar()..showSnackBar(snackBar);
   }
}