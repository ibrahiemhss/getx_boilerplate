import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labelText;
  final String placeholder;
  final Color color;
  final double fontSize;
  final bool password;
  final bool showPlaceHolder;
  final int? maxLines;

  final String? Function(String?)? validator;
  final Function(String?)? onTextChanged;

  InputField({
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.labelText = '',
    this.placeholder = '',
    this.color = Colors.white,
    this.fontSize = 22.0,
    this.password = false,
    this.validator,
    this.onTextChanged,
    this.showPlaceHolder = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        print("otap field");
      },
      onChanged: onTextChanged,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(vertical: 2.0),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: this.color,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: this.color,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: this.labelText,
        labelStyle: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(color: Theme.of(context).hintColor),
        hintText: showPlaceHolder ? this.placeholder : null,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        filled: true,
        isDense: true,
      ),
      controller: this.controller,
      style: Theme.of(context).textTheme.bodySmall,
      keyboardType: this.keyboardType,
      obscureText: this.password,
      autocorrect: false,
      validator: this.validator,
      maxLines: maxLines,
    );
  }
}
