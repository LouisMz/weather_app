// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputBasicForm extends StatefulWidget {
  final String hintText, labelText;
  TextInputType? textInputType = TextInputType.text;
  final double borderRadius;
  final TextEditingController controller;

  InputBasicForm(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.controller,
      required this.borderRadius,
      this.textInputType})
      : super(key: key);

  @override
  State<InputBasicForm> createState() => _InputBasicFormState();
}

class _InputBasicFormState extends State<InputBasicForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [LengthLimitingTextInputFormatter(50)],
      maxLines: 1,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      decoration: InputDecoration(
          filled: true,
          //fillColor: ,
          hintText: widget.hintText,
          labelText: widget.labelText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(color: Colors.black)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(color: Colors.red)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(color: Colors.black))),
      validator: (v) {
        if (v!.isNotEmpty) {
          return null;
        } else {
          return 'Veuillez entrer des informations valides';
        }
      },
    );
  }
}
