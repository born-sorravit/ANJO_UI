import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final String title;
  final String note;
  final String hintText;
  final Icon icon;
  final Size size;
  final String textvalidate;
  final TextEditingController _input;
  final int length;
  const InputText({
    Key? key,
    required this.size,
    required TextEditingController input,
    required this.note,
    required this.title,
    required this.hintText,
    required this.icon,
    required this.textvalidate, required this.length,
  })  : _input = input,
        super(key: key);
  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  int textlength = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: widget.size.height * 0.25,
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              // height: widget.size.height * 0.07,
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                controller: widget._input,
                maxLength: widget.length >= 500 ? widget.length : null,
                decoration: InputDecoration(
                  
                  contentPadding: EdgeInsets.only(left: 20, right: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  hintText: widget.hintText,
                  suffixIcon: textlength > 6 ? widget.icon : null,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return widget.textvalidate;
                  }
                  return null;
                },
                onChanged: (_input) {
                  setState(() {
                    textlength = _input.length;
                  });
                },
              ),
            ),
          ),
          ListTile(
            title: Text(
              widget.note,
              style: TextStyle(fontSize: 14, color: Colors.black38),
            ),
          ),
        ],
      ),
    );
  }
}
