import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final double height;
  final double width;

  const Button({
    required this.onPressed,
    required this.label,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF008101),

              Color(0xFF01C000), //01C000
//008101
            ],
          ),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontFamily: 'DM Sans'),
          ),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
