import 'package:cendikia/theme.dart';
import 'package:flutter/material.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super (key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isErrorVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        children: [
          Container(
            margin: EdgeInsets.only(top: 70, bottom: 20),
            child: Center(
              child: Image.asset(
                'assets/cendikia.png',
                height: 200,
              ),
            ),
          ),
          Text(
          'Sign In',
            style: title1.copyWith(fontSize: 24),
          ),
        ],
      ),
    );
  }
}