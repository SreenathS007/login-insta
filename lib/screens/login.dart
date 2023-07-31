import 'package:flutter/material.dart';
import 'package:login_page/main.dart';
import 'package:login_page/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isDataMatched = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            const    Image(
                  image: AssetImage('assets/images/Logo.png'),
                  height: 100,
                  width: 70,
                ),
        const   SizedBox(height: 10),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(),
                      hintText: 'phone number,username,or email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email and password must required';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder( ),
                      hintText: 'Password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email and pasword must required';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      CkeckLogin(context);
                    } else {
                      print('data empty');
                    }
                  },
                  child:  Text('Log in'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(500, 40),
                  ),
                ),
                SizedBox(height: 18),
                Text('Forgot password?'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void CkeckLogin(BuildContext ctx) async{
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == 'sreenath@123' && _password == '12345') {
      //Goto Home

    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.setBool(SAVE_KEY_NAME, true);

      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
    } else {
      final _errorMessage = 'Username or Password doesnot match';

      //Alert Dialogue
      showDialog(
          context: ctx,
          builder: (ctx1) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(_errorMessage),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx1).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          });
    }
  }
}
