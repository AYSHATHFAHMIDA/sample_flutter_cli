import 'package:flutter/material.dart';
import 'package:sample_flutter_cli/authentication.dart';
import 'package:sample_flutter_cli/screens/loginPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
            onPressed: () {
              AuthenticationHelper()
                  .signOut().then((result)=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage())));
            },
            child: const Text('LogOut'),

        ),
      ),
    );
  }
}
