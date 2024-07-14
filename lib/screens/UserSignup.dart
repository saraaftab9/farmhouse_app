import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmhouse_app/screens/Login.dart';
import 'package:farmhouse_app/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserSignup extends StatefulWidget {
  const UserSignup({super.key});

  @override
  State<UserSignup> createState() => _UserSignupState();
}

class _UserSignupState extends State<UserSignup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isLoading = false;

  Future<void> _signUp() async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);

      // Add user data to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': _nameController.text,
        'email': _emailController.text,
        'role': 'User', // Set default role for user signup
      });

      setState(() {
        _isLoading = false; // Hide loading indicator
      });

      // Navigate to login screen after successful signup
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Login(
                  selectedRole: 'User',
                )),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isLoading = false; // Hide loading indicator
      });

      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        // Handle the case where the email is already in use
        // You can show a snackbar or dialog to inform the user
        // that the email is already registered.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The email address is already in use.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false; // Hide loading indicator
      });

      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF7FCFCFC),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 16),
                  child: Text(
                    'User Sign Up',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'DM Sans'),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 4),
                  child: Text(
                    'Sign up now to register with us ',
                    style: TextStyle(fontSize: 16, fontFamily: 'DM Sans'),
                  ),
                ),
                SizedBox(height: 15),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 16),
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(color: Colors.grey),
                              prefixIcon: SizedBox(
                                width: 24,
                                height: 24,
                                child: SvgPicture.asset(
                                  'assets/icons/person.svg',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.grey),
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
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: SizedBox(
                                width: 24,
                                height: 24,
                                child: SvgPicture.asset(
                                  'assets/icons/lock.svg',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              suffixIcon: Icon(
                                Icons.visibility_off,
                                color: Colors.green,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.white70),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                            ),
                          ),
                          SizedBox(height: 32),
                          Button(
                              height: 55,
                              width: 400,
                              onPressed: _signUp,
                              label: 'Sign Up'),
                          SizedBox(height: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'By clicking signup you agree to our',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    ' Terms & ',
                                    style: TextStyle(color: Color(0XFF01C000)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Conditions ',
                                    style: TextStyle(color: Color(0XFF01C000)),
                                  ),
                                  Text(
                                    ' and ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    ' Privacy Policy ',
                                    style: TextStyle(color: Color(0XFF01C000)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account?',
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login(
                                              selectedRole: "",
                                            )),
                                  );
                                },
                                child: Text(
                                  "Login Now",
                                  style: TextStyle(
                                    color: Color(0XFF01C000),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'DM Sans',
                                  ),
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
