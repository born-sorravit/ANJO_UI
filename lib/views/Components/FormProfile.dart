import 'package:flutter/material.dart';

class FormProfile extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController _input;

  FormProfile({
    Key? key,
    required TextEditingController input,
    required this.title,
    required this.hintText,
  })  : _input = input,
        super(key: key);

  @override
  _FormProfileState createState() => _FormProfileState();
}

class _FormProfileState extends State<FormProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
          title: Text(widget.title , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold , color: Colors.black54),),
          trailing: Container(
            width: 150,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.right,
                    controller: widget._input,
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
