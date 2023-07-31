import 'package:flutter/material.dart';
import 'package:login_page/main.dart';
import 'package:login_page/screens/home.dart';
import 'package:login_page/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    CheckUserLogedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/Logo.png',
          height: 100,
        ),
      ),
      bottomNavigationBar: Image.asset(
        'assets/images/Meta-Logo-PNG-1.png',
        height: 40,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> GotoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => ScreenLogin(),
      ),
    );
  }

  Future<void> CheckUserLogedIn() async {
    final _sharedPrefs = await SharedPreferences.getInstance();

    final _userLogedIn = _sharedPrefs.getBool(SAVE_KEY_NAME);

    if (_userLogedIn == null || _userLogedIn == false) {
      GotoLogin();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
    }
  }
}
