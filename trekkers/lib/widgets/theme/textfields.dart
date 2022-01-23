import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String hintText;
  final String Function(String value) validator;
  final void Function(String value) onSaved;

  const CustomTextFormField(
      {Key key,
      this.controller,
      this.keyboardType,
      this.obscureText,
      this.hintText,
      this.validator,
      this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscureText ?? false,
      style: TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        filled: true,
        fillColor: Color.fromRGBO(255, 255, 255, 1),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white24, width: 1.0),
        ),
        hintText: hintText ?? "",
        hintStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: validator,
    );
  }
}
