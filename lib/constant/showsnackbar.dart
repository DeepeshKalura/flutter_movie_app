import 'package:flutter/material.dart';

void showCustomSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 6.0,
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 3),
      content: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 166, 255, 77),
              Color.fromARGB(255, 15, 71, 11),
            ],
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white, size: 30.0),
            const SizedBox(width: 16.0),
            Text(
              message,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
