import 'package:flutter/material.dart';
import 'package:sample_flutter_cli/screens/loginPage.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? name;
  bool agree = false;
  bool _obsscureText = false;
  final pass_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding:  EdgeInsets.only(top: 50),
          child: Column(
            children:<Widget> [
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return'please enter some text';
                    }
                    return null;
                  },
                  onSaved: (value){
                    email=value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: pass_controller,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),

                    suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          _obsscureText=!_obsscureText;
                        });
                      },
                      child: Icon(_obsscureText?Icons.visibility_off:Icons.visibility),
                    ),
                    hintText: 'Password',
                    border: OutlineInputBorder(),

                  ),
                  onSaved: (value){
                    password=value;
                  },
                  obscureText: !_obsscureText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'confirm password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){

                  },
                ),
              ),
              ElevatedButton(onPressed: () {}, child: const Text('signup')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(new MaterialPageRoute(
                        builder: (builder) => LoginPage()));
                  },
                  child: const Text('already a user?signIn'))
            ],
          ),
        ),
      ),
    );
  }
}
