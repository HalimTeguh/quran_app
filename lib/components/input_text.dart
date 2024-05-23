import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  InputText({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.inputType,
  });

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  TextInputType? inputType;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  bool _isObscure = true;

  void passwordVisible() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  void passwordTypeChecker() {}

  @override
  Widget build(BuildContext context) {
    bool _isPasswordType =
        (widget.inputType == TextInputType.visiblePassword) ? true : false;

    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isPasswordType ? _isObscure : false,
      decoration: InputDecoration(
        suffixIcon: _isPasswordType
            ? IconButton(
                onPressed: passwordVisible,
                icon: _isObscure
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
              )
            : null,
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: TextStyle(
          fontSize: 14,
          color: Colors.deepPurpleAccent,
        ),
        hintStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black26,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.deepPurpleAccent,
            width: 3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.deepPurpleAccent.shade100,
            width: 2,
          ),
        ),
      ),
    );
  }
}
