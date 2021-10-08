import 'package:flutter/material.dart';

class InputOther extends StatefulWidget {
  final String title;
  final String hintText;
  final String textvalidate;

  final Size size;
  final TextEditingController _input;
  InputOther({
    Key? key,
    required this.size,
    required TextEditingController input, required this.title, required this.hintText, required this.textvalidate,
  }) :_input = input, super(key: key);

  @override
  _InputOtherState createState() => _InputOtherState();
}

class _InputOtherState extends State<InputOther> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    top: 5,
                  ),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ))
            ],
          ),
          Container(
            // color: Colors.red,
            margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
            // height: widget.size.height * 0.07,
            child: Container(
              // height: widget.size.height * 0.07,
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                controller: widget._input,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return widget.textvalidate;
                  }
                  return null;
                },
                decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20, right: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintStyle: TextStyle(color: Colors.grey[500]),
                hintText: widget.hintText,
               
              ),
                onChanged: (_input) {
                  // widget.icon = widget.icon ;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
