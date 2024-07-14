import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmhouse_app/screens/AdminHome.dart';
import 'package:farmhouse_app/screens/AdminSignup.dart';
import 'package:farmhouse_app/screens/HomeScreen.dart';
import 'package:farmhouse_app/screens/UserSignup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/button.dart';

class Login extends StatefulWidget {
  final String selectedRole;

  const Login({Key? key, required this.selectedRole});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);

      // Verify user role
      String? userRole = await _getUserRole(userCredential.user!.uid);

      // Navigate to appropriate screen based on role
      if (userRole == 'Admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminHome()),
        );
      } else if (userRole == 'User') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        // Handle unexpected case where user has no role assigned
        setState(() {
          _errorMessage = 'Invalid role assigned. Please contact support.';
          _isLoading = false;
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = e.message ?? 'Authentication failed';
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to login. Please try again later.';
      });
    }
  }

  Future<String?> _getUserRole(String uid) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (snapshot.exists) {
        return snapshot.data()?['role'];
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching user role: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xF7FCFCFC),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 16),
            child: Text(
              'Sign in',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DM Sans'),
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(left: 16, bottom: 4),
            child: Text(
              'Sign in to your account if you already\nhave one.',
              style: TextStyle(fontSize: 16, fontFamily: 'DM Sans'),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 9),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: SizedBox(
                          width: 24,
                          height: 24,
                          child: SvgPicture.asset(
                            'assets/icons/email.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xFE3DFE3)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.green),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: SizedBox(
                          width: 24,
                          height: 24,
                          child: SvgPicture.asset(
                            'assets/icons/lock.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        suffixIcon: SizedBox(
                          width: 24,
                          height: 24,
                          child: SvgPicture.asset(
                            'assets/icons/eye.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade50),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.green),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Implement password reset functionality
                        },
                        child: const Text(
                          'Forgot password?',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Color(0XFF01C000),
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : Button(
                            height: 50,
                            width: double.infinity,
                            onPressed: _login,
                            label: 'Login'),
                    const SizedBox(height: 16),
                    _errorMessage.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _errorMessage,
                              style: const TextStyle(color: Colors.red),
                            ),
                          )
                        : Container(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don’t have an account?',
                        ),
                        TextButton(
                          onPressed: () {
                            if (widget.selectedRole == 'Admin') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AdminSignup(),
                                ),
                              );
                            } else if (widget.selectedRole == 'User') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserSignup(),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            "Register now",
                            style: TextStyle(
                                color: Color(0XFF01C000),
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
