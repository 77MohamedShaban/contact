import 'package:flutter/material.dart';

class TextFieldLogin extends StatelessWidget {
  final String text;
  final Function(String) onChanged;
  final TextInputType type;
 TextFieldLogin({required this.text,required this.onChanged,required this.type});
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 50,
      child: TextField(
        keyboardType: type
        ,onChanged: onChanged
        ,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          hintText: text,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xffE2F4F6),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Color(0xffFFF1D4),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Color(0xFF68A1FF),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
