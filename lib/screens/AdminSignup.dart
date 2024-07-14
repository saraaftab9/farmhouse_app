import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmhouse_app/screens/Login.dart';
import 'package:farmhouse_app/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdminSignup extends StatefulWidget {
  const AdminSignup({Key? key});

  @override
  State<AdminSignup> createState() => _AdminSignupState();
}

class _AdminSignupState extends State<AdminSignup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  bool _isLoading = false; // Track loading state
  String _errorMessage = ''; // Track error message

  Future<void> _signUp() async {
    setState(() {
      _isLoading = true; // Start loading
      _errorMessage = ''; // Reset error message
    });

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);

      // Add admin data to Firestore with 'Admin' role
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': _nameController.text,
        'email': _emailController.text,
        'role': 'Admin',
      });

      // Show success message using Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Account created successfully!'),
          duration: Duration(seconds: 2),
        ),
      );

      // Navigate to login screen after successful signup
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(
            selectedRole: 'Admin',
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isLoading = false; // Stop loading on error
        _errorMessage = e.message ?? 'Unknown error occurred';
      });
    } catch (e) {
      setState(() {
        _isLoading = false; // Stop loading on error
        _errorMessage = 'Failed to create account. Please try again later.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF7FCFCFC),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 16),
            child: Text(
              'Admin Sign Up',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontFamily: 'DM Sans',
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 4),
            child: Text(
              'Sign up now to register your\nfarmhouse or hotels with us ',
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
                          borderSide: BorderSide(color: Colors.grey.shade200),
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
                    _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : Button(
                            height: 55,
                            width: 400,
                            onPressed: _signUp,
                            label: 'Sign Up'),
                    SizedBox(height: 4),
                    _errorMessage.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _errorMessage,
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        : Container(),
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
                                ),
                              ),
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
