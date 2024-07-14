import 'dart:async';

import 'package:farmhouse_app/screens/RoleSelection.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RoleSelectionScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF01C000), // #01C000
              Color(0xFF008101),
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'images/splash.png',
                      height: 120,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Farm House Management',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Aclonica',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Text(
                'Version 0.0.1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
