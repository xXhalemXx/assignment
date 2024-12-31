import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final void Function(String) onChanged;
  final String? errorText;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    required this.onChanged,
    this.errorText,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        errorText: errorText,
      ),
      keyboardType: keyboardType,
      onChanged: onChanged,
    );
  }
}
