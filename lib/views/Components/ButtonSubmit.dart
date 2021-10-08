import 'package:flutter/material.dart';

class ButtonSubmit extends StatefulWidget {
  final StatefulWidget page;
  final GlobalKey<FormState> validate;
  ButtonSubmit({Key? key, required this.page, required this.validate})
      : super(key: key);

  @override
  _ButtonSubmitState createState() => _ButtonSubmitState();
}

class _ButtonSubmitState extends State<ButtonSubmit> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.05,
      width: size.width * 0.9,
      child: ElevatedButton(
        child: Text(
          'ดำเนินการต่อ',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        style: ElevatedButton.styleFrom(shape: StadiumBorder(), elevation: 1),
        onPressed: () {
          if (widget.validate.currentState!.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(builder: (context) => widget.page),
            );
          }
        },
      ),
    );
  }
}
