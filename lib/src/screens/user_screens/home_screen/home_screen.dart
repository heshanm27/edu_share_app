import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Future SignOut () async{
    await FirebaseAuth.instance.signOut();
  }
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Organization User")),
          body: Container(
            child: Center(child: ElevatedButton(onPressed: ()=> SignOut(),child:Text("Organization User SignOut" )),
            ),
          ),
        )
    );
  }
}
