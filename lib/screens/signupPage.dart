import 'package:flutter/material.dart';
class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            TextField(),
            TextField(),
            TextField(),
            ElevatedButton(onPressed: (){}, child: Text('signup'))
          ],
        ),
      ),
    );
  }
}
