import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            UserCredential userCredential =
                await FirebaseAuth.instance.signInAnonymously();
            print('${userCredential.user}');
          },
          child: Text(
            'SIGN IN',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
