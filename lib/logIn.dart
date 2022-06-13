import 'package:flutter/material.dart';
import 'Services/AuthService.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  //_RegisterScreen createState() => _RegisterScreen();
  State<LogIn> createState() => _LogIn();
}

class _LogIn extends State<LogIn> {
  TextEditingController _email = TextEditingController();
  TextEditingController _passwd = TextEditingController();
  final AuthenticationServices _auth = AuthenticationServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Center(
          child: SizedBox(
        width: 300,
        child: Column(children: <Widget>[
          const SizedBox(height: 30),
          Text(
            'Welcome back!',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          const SizedBox(height: 30),
          TextFormField(
            controller: _email,
            decoration: InputDecoration(
              hintText: 'Mail',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _passwd,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              signInUser();
            },
            child: const Text('Log In'),
          ),
        ]),
      )),
    );
  }

  void signInUser() async {
    dynamic authResult = await AuthenticationServices.loginUser(_email.text, _passwd.text);
    if (authResult == null) {
      print("log in error");
    } else {
      _email.clear();
      _passwd.clear();
      print("Succesful login ");
      Navigator.pushNamed(context, '/mainPage',
        arguments: {'uid': authResult.uid},
      );
    }
  }
}
