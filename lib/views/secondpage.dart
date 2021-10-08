import 'package:anjo_ui/views/Components/ButtonSubmit.dart';
import 'package:anjo_ui/views/Components/InputText.dart';
import 'package:anjo_ui/views/Components/selectgender.dart';
import 'package:anjo_ui/views/Components/selectinterest.dart';
import 'package:anjo_ui/views/thirdpage.dart';
import 'package:flutter/material.dart';

import 'Components/InputOther.dart';

class SecondPage extends StatefulWidget {
  final TextEditingController name;
  final TextEditingController anjo_id;
  final TextEditingController day, month, year;
  SecondPage(
      {Key? key,
      required this.name,
      required this.anjo_id,
      required this.day,
      required this.month,
      required this.year})
      : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final validation = GlobalKey<FormState>();
  final description = TextEditingController();
  final job = TextEditingController();
  final education = TextEditingController();
  final gender = TextEditingController();
  // String gender = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(true),
        ),
        centerTitle: true,
        title: Text(
          "ข้อมูลของฉัน",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white, //You can make this transparent
        elevation: 1,
      ),
      backgroundColor: Colors.grey.shade100,
      body: Form(
        key: validation,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              SelectGender(
                title: 'เพศกำเนิด',
                gender: gender.text,
                note: 'โปรดเลือก',
                highlight: 'เพศตามกำเนิด',
                subnote:
                    'ของคุณเพื่อความแม่นยำและถูกต้องในการคำนวณข้อมูลความสัมพันธ์',
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SelectInterest(),
              SizedBox(
                height: size.height * 0.01,
              ),
              InputText(
                size: size,
                input: description,
                note:
                    'เพิ่มคำอธิบายเพิ่มเติมเกี่ยวกับตัวคุณเพื่อแนะนำตัวกับคนอื่นๆใน ANJO เพื่อเพิ่มโอกาสในการแมตช์',
                title: 'คำอธิบายเกี่ยวกับตัวฉัน',
                hintText: 'โประระบุคำอธิบาย',
                icon: Icon(null),
                textvalidate: 'โปรดระบุคำอธิบาย',
                length: 500,
              ),
              InputOther(
                size: size,
                input: job,
                title: 'อาชีพ',
                hintText: 'ระบุอาชีพของคุณ',
                textvalidate: 'โปรดระบุอาชีพของคุณ',
              ),
              InputOther(
                size: size,
                input: education,
                title: 'สถานศึกษา',
                hintText: 'ระบุสถานศึกษาของคุณ',
                textvalidate: 'โปรดระบุสถานศึกษาของคุณ',
              ),
              SizedBox(
                height: size.height * 0.01,
                child: Container(
                  color: Colors.white,
                ),
              ),
              Container(
                width: size.width,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonSubmit(
                      page: ThirdPage(
                        anjo_id: widget.anjo_id,
                        name: widget.name,
                        day: widget.day,
                        month: widget.month,
                        year: widget.year,
                        gender: gender,
                        description: description,
                        education: education,
                        job: job,
                      ),
                      validate: validation,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
