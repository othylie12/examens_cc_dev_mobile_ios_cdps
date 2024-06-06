import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String text;
  
  
  final Color color;
  final Color textColor;
  final String imagePath;

  const SocialButton({super.key, 
    required this.text,
    required this.imagePath,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor, backgroundColor: color,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
      icon:  Image.asset(
        imagePath,
        height: 24.0, 
      ),
      label: Text(text),
      onPressed: () {},
    );
  }
}
