import 'package:flutter/material.dart';
import 'package:cendikia/theme.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState (){
    
    Timer (Duration(seconds: 3),
    (()=> Navigator.pushNamed(context, '/onboarding')));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child:  RichText(
          text: TextSpan(children: <TextSpan>[
            TextSpan(text: 'Cendikia', style: title1),
          ]),
          )),
    );
  }
}