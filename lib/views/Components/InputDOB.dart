import 'package:flutter/material.dart';

class InputDOB extends StatefulWidget {
  final Size size;
  final String hintText;
  final double width;
  final String textvalidate;
  final ValueChanged<String>? onChanged;

  final TextEditingController _input;
  const InputDOB({
    Key? key,
    required this.size,
    required TextEditingController input,
    required this.hintText,
    required this.width,
    required this.textvalidate, this.onChanged,
  })  : _input = input,
        super(key: key);

  @override
  _InputDOBState createState() => _InputDOBState();
}

class _InputDOBState extends State<InputDOB> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: Text(widget.hintText),
        ),
        SizedBox(
            width: widget.size.width * widget.width,
            child: Column(
              children: [
                Container(
                    child: TextFormField(
                        controller: widget._input,
                        
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20, right: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintStyle:
                              TextStyle(color: Colors.grey[500], fontSize: 14),
                          hintText: widget.hintText,
                          errorStyle: TextStyle(
                            height: 0,
                            fontSize: 14.0,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                        onChanged: widget.onChanged,)),
              ],
            )),
      ],
    );
  }
}
