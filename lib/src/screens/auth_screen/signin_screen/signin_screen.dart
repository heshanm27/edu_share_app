import 'package:flutter/material.dart';
import '../../../utils/shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  @override
  void initState() {
    super.initState();
    AppSharedPreferences.setonBoardingState(false);
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(
          child: Center(
              child: Text("SignIn")
          ),
        )
    );
  }


}
