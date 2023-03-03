import 'package:flutter/material.dart';
import 'package:sample_flutter_cli/authentication.dart';
import 'package:sample_flutter_cli/screens/signupPage.dart';

import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _foromkey=GlobalKey<FormState>();
  String? email;
  String? password;
  bool _oscureText=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('email-password Auth'),
      ),
      body: Form(
        key: _foromkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  prefixIcon:  Icon((Icons.email_outlined)),
                  labelText: 'email',
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'please enter the email';
                  }
                  return null;
                },
                onSaved: (value){
                  email=value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  labelText: 'password',
                  border:OutlineInputBorder(),
                  suffixIcon: GestureDetector(
                    onTap: (){
                      setState(() {
                        _oscureText=!_oscureText;
                      });
                    },
                    child: Icon(
                      _oscureText?Icons.visibility_off:Icons.visibility,
                    ),
                  )

                ),
                obscureText: _oscureText,
                onSaved: (value){
                  password=value;
                },
                validator: (value){
                  if(value!.isEmpty){
                    return 'please enter the password';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(onPressed: (){
              if(_foromkey.currentState!.validate()){
                _foromkey.currentState!.save();

                AuthenticationHelper()
                .signIn(email:email!,password:password!)
                .then((result){
                  if(result==null){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>HomePage()));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:Text(result,style: const TextStyle(fontSize: 16),)
                    ));
                  }
                });
              }
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
