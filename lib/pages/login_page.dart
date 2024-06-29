import 'package:cendikia/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cendikia/widgets/widget.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super (key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool _isErrorVisible = false;
  AccessToken? _accessToken;
  Map<String, dynamic>? _userData;
  String _verificationId = 'S';

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
          const SizedBox(
            height: 10,
          ),
          Text(
            'Hi there!, Nice to see you again.',
            style: TextStyle(
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.white),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: 'Email',
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
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.white),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: 'Password',
              hintStyle: TextStyle(
                color: textColor1,
                fontStyle: FontStyle.italic,
                fontSize: 15,
              ),
            ),
          ),
          if (_isErrorVisible)
            Text(
              'Email atau Password Anda Salah, Coba Lagi!',
              style: TextStyle(
                color: Colors.red,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
              onPressed: () {
                if (_emailController.text == '_emailController' &&
                    _passwordController.text == '_passwordController') {
                  //  Navigator.push(
                  //    context,
                  //    MaterialPageRoute(builder: (context) => HomePage()),
                  //  );
                } else {
                  setState(() {
                    _isErrorVisible = true;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor2,
                minimumSize: Size(256, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: backgroundColor1,
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
            ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Or use one of your Social Profiles',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            icon: const Icon(FontAwesomeIcons.facebook, color: Colors.white),
            label: const Text('Facebook'), 
            onPressed: _loginWithFacebook,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 72, 102, 247),
              minimumSize: const Size(256, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.center,
            ),
          ),
          if (_accessToken != null)
            Column(
              children: [
                const Text('Logged in!'),
                Text('Access Token: ${_accessToken!.tokenString}'),
                if (_userData != null) Text('User Data: ${_userData!['name']}'),
                ElevatedButton(
                  onPressed: _logoutFromFacebook,
                  child: const Text('Logout'),
                ),
              ],
            ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _phoneController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.white),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: 'Phone Number',
              hintStyle: TextStyle(
                color: textColor1,
                fontStyle: FontStyle.italic,
                fontSize: 15,
              ),
            ),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: _sendOTP,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor2,
              minimumSize: Size(256, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Text(
              'Send OTP',
              style: TextStyle(
                color: backgroundColor1,
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _otpController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.white),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: 'OTP',
              hintStyle: TextStyle(
                color: textColor1,
                fontStyle: FontStyle.italic,
                fontSize: 15,
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: _verifyOTP,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor2,
              minimumSize: Size(256, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Text(
              'Verify OTP',
              style: TextStyle(
                color: backgroundColor1,
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _loginWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;
      final userData = await FacebookAuth.instance.getUserData();
      setState(() {
        _userData = userData;
      });
    } else {
      print(result.status);
      print(result.message);
    }
  }

  Future<void> _logoutFromFacebook() async {
    await FacebookAuth.instance.logOut();
    setState(() {
      _accessToken = null;
      _userData = null;
    });
  }
  Future<void> _sendOTP() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: _phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        print("Login successful");
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
        });
        print('OTP sent to ${_phoneController.text}');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
  }

  Future<void> _verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: _otpController.text,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    print("Login successful");
  }
}

