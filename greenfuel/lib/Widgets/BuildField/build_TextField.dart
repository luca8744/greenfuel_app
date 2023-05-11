import 'package:flutter/material.dart';

class BuildTextField extends StatefulWidget {
  final String _labelText;
  final String _placeholder;
  final Function _updateData;

  BuildTextField(this._labelText, this._placeholder, this._updateData);

  @override
  State<BuildTextField> createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {
  final _Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: _Controller,
        onEditingComplete: () {
          return widget._updateData(widget._labelText, _Controller.text);
        },
        obscureText: false,
        decoration: InputDecoration(
            labelText: widget._placeholder,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: widget._labelText,
            hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
      ),
    );
  }
}
