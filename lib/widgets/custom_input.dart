import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmit;
  final FocusNode focusNode;
  CustomInput({this.hintText,this.onChanged,this.onSubmit,this.focusNode});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
          color: Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(12)),
      child: TextField(
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmit,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText ?? 'HInt TExt ..',
            contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 18)),
        style: Constants.regularDarkText,
      ),
    );
  }
}
