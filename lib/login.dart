import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'SharedPrefrences.dart';



const String _storageKeyMobileToken = "token";

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  bool _isLoading = false;
  var errorMsg;
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150.0,
            width: 190.0,
            padding: EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
            ),
            //child: Center(
              //child: Image.asset('assets/codemode.png'),
            //),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                  hintText: 'Enter valid mail id as abc@gmail.com'
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your secure password'
              ),
            ),
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () {
                print("Login pressed");
                setState(() {
                  _isLoading = true;
                });
                signIn(_usernameController.text, _passwordController.text);
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),

        ],
      ),
    );
  }

  signIn(email, password) async {
    Map data = {
      'email': email,
      'password': password
    };

    var respons = await http.post(
        Uri.parse("https://buymanews.ir/login/loginuser"), body: data);

    var rawToken = json.decode(respons.body);
    var token = rawToken['token'];

    await setMobileToken(token);
    if (respons.statusCode == 200) {
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => MyHomePage(title: 'News Management',)), (
          Route<dynamic> route) => false);
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

}

