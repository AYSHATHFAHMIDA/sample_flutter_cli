import 'package:flutter/material.dart';
import 'package:sample_flutter_cli/screens/signupPage.dart';

import 'HomePage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('email-password Auth'),
      ),
      body: Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: 'password',
                  border:OutlineInputBorder(),

                ),
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (builder)=>HomePage()));
            }, child: Text('login')),
            TextButton(onPressed: (){
              Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (builder)=>SignUp()));
            }, child: Text('not a user? signUp'))
          ],
        ),
      ),
    );
  }
}
