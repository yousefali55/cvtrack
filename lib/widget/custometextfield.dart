import 'package:flutter/material.dart';

class signin extends StatelessWidget {
  final String email;
  final String label;
    final TextEditingController? controller;  // Nullable controller

  
  const signin({
    super.key,
    required this.email,
    required this.label, this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: email,
          labelText: label,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.orange,
              )),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
