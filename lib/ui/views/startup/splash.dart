import 'dart:async';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LogIn(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'logo',
          child: SvgPicture.asset(
            'images/logo.svg',
            color: blue,
            height: 32,
          ),
        ),
      ),
    );
  }
}
