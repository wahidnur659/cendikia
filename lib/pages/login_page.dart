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
            margin: EdgeInsets.only(top: 132, bottom : 80),
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: 'Cendikia', style: title1)
                  ],
                ),
              ),
            ),
          ),
          Text(
            'LOGIN',
            style: title1.copyWith(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 29,
          ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color : Colors.white), 
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: 'EMAIL',
              hintStyle: TextStyle(
                color: textColor1,
                fontStyle: FontStyle.italic,
                fontSize: 15, 
              ),
            ),
          ),
          SizedBox(
            height: 29,
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color : Colors.white), 
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: 'PASSWORD',
              hintStyle: TextStyle(
                color: textColor1,
                fontStyle: FontStyle.italic,
                fontSize: 15, 
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          if (_isErrorVisible)
          Text(
            'Email atau Password Anda Salah,Coba Lagi!!',
            style: TextStyle(
              color: Colors.red,
              fontSize: 15,
            ),
            textAlign:  TextAlign.center,
          ),
          SizedBox(
            height: 55,
          ),
          ElevatedButton(
            onPressed: () {
                if (_emailController.text == ' ' &&
                    _passwordController.text == ' ') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else {
                  setState(() {
                    _isErrorVisible = true;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: textColor1,
                minimumSize: Size(256, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                'Masuk',
                style: TextStyle(
                    color: backgroundColor1,
                    fontSize: 20,
                    fontWeight: medium),
              ))
        ],
      ),
    );
  }
}