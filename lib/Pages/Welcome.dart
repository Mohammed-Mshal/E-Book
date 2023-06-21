import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_project/Pages/Login.dart';
class Welcome extends StatefulWidget {
  const Welcome({
    Key? key,
  }) : super(key: key);
  _Welcome createState() => _Welcome();
}
class _Welcome extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) => {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Login(context: context),
              ))
        }
        );
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('images/R.gif'),
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
