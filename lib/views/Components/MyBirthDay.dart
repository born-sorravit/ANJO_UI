import 'package:anjo_ui/views/secondpage.dart';
import 'package:flutter/material.dart';

import 'ButtonSubmit.dart';
import 'InputDOB.dart';
// import 'Space.dart';

class MyBirthDay extends StatefulWidget {
  final Size size;
  final String note;
  final TextEditingController day;
  final TextEditingController month;
  final TextEditingController year;
  MyBirthDay(
      {Key? key,
      required this.size,
      required this.day,
      required this.month,
      required this.year,
      required this.note})
      : super(key: key);

  @override
  _MyBirthDayState createState() => _MyBirthDayState();
}

class _MyBirthDayState extends State<MyBirthDay> {
    final validation = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: validation,
      child: Container(
        height: widget.size.height * 0.28,
        color: Colors.white,
        child: Column(
          children: [
            ListTile(
              title: Text(
                "วันเกิดของฉัน",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InputDOB(
                  size: widget.size,
                  input: widget.day,
                  hintText: 'วัน',
                  width: 0.15,
                  textvalidate: 'โปรดระบุชื่อของคุณ',
                ),
                // Space(),
                InputDOB(
                  size: widget.size,
                  input: widget.month,
                  hintText: 'เดือน',
                  width: 0.15,
                  textvalidate: 'โปรดระบุชื่อของคุณ',
                ),
                // Space(),
                InputDOB(
                  size: widget.size,
                  input: widget.year,
                  hintText: 'ปี',
                  width: 0.2,
                  textvalidate: 'โปรดระบุชื่อของคุณ',
                ),
              ],
            ),
            SizedBox(
              height: widget.size.height * 0.01,
            ),
            ListTile(
              title: Text(
                widget.note,
                style: TextStyle(fontSize: 14, color: Colors.black38),
              ),
            ),
            // SizedBox(
            //   height: widget.size.height * 0.03,
            // ),
            // ButtonSubmit(page: SecondPage()),
          ],
        ),
      ),
    );
  }
}

