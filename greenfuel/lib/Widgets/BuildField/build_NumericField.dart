import 'package:flutter/material.dart';

class BuildNumericField extends StatefulWidget {
  final String _labelText;
  final String _placeholder;
  final Function _updateData;

  BuildNumericField(this._labelText, this._placeholder, this._updateData);

  @override
  State<BuildNumericField> createState() => _BuildNumericFieldState();
}

class _BuildNumericFieldState extends State<BuildNumericField> {
  final _Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: _Controller,
        onEditingComplete: () {
          return widget._updateData(_Controller.text);
        },
        obscureText: false,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: widget._placeholder,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: widget._labelText,
            hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
      ),
    );
  }
}
