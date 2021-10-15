import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Components/FormProfile.dart';

class ThirdPage extends StatefulWidget {
  final TextEditingController name;
  final TextEditingController anjo_id;
  final TextEditingController day, month, year;
  final TextEditingController description;
  final TextEditingController job;
  final TextEditingController education;
  final TextEditingController gender;
  ThirdPage(
      {Key? key,
      required this.name,
      required this.anjo_id,
      required this.day,
      required this.month,
      required this.year,
      required this.description,
      required this.job,
      required this.education,
      required this.gender})
      : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final description = TextEditingController();
  final job = TextEditingController();
  final education = TextEditingController();
  final gender = TextEditingController();
  final interest = TextEditingController();
  final country = TextEditingController();
  final city = TextEditingController();
  final name = TextEditingController();
  final anjo_id = TextEditingController();
  final dob = TextEditingController();

  void setdob(){
    setState(() {
      dob.text = "${widget.day.text}/${widget.month.text}/${widget.year.text}";
      country.text = "ประเทศไทย";
      city.text = "พังงา";
    });
    print(dob.text);
  }
  @override
  void initState() {
    super.initState();
    setdob();
  }
  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: const Text(
          "ข้อมูลโปรไฟล์",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "บันทึก",
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ))
        ],
        backgroundColor: Colors.white, //You can make this transparent
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
              child: Row(
                children: [
                  Text("โปรไฟล์"),
                ],
              ),
            ),
            FormProfile(
                input: widget.description,
                title: 'คำอธิบายเกี่ยวกับตัวฉัน',
                hintText: 'ระบุอธิบาย'),
            Divider(
              height: 0.5,
            ),
            FormProfile(input: widget.job, title: 'อาชีพ', hintText: 'ระบุอาชีพ'),
            Divider(
              height: 0.5,
            ),
            FormProfile(
                input: widget.education,
                title: 'สถานศึกษา',
                hintText: 'ระบุสถานศึกษา'),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
              child: Row(
                children: [
                  Text("เพศ"),
                ],
              ),
            ),
            FormProfile(input: widget.gender, title: 'เพศกำเนิด', hintText: 'ระบุเพศ'),
            Divider(
              height: 0.5,
            ),
            FormProfile(
                input: interest,
                title: 'เพศของฉัน',
                hintText: 'ระบุความชอบทางเพศ'),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
              child: Row(
                children: [
                  Text("เมืองเกิด"),
                ],
              ),
            ),
            FormProfile(
                input: country, title: 'ประเทศ', hintText: 'ระบุประเทศ'),
            Divider(
              height: 0.5,
            ),
            FormProfile(input: city, title: 'เมือง', hintText: 'ระบุเมือง'),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
              child: Row(
                children: [
                  Text("ข้อมูลทั่วไป"),
                ],
              ),
            ),
            FormProfile(input: widget.name, title: 'ชื่อของฉัน', hintText: 'ระบุชื่อ'),
            Divider(
              height: 0.5,
            ),
            FormProfile(input: widget.anjo_id, title: 'ANJO ID', hintText: 'ระบุไอดี'),
            Divider(
              height: 0.5,
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text(
                  "อนุญาติให้เพิ่มเพื่อนด้วย ID",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                trailing: CupertinoSwitch(
                  value: _switchValue,
                  activeColor: Colors.pink,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
              ),
            ),
            Divider(
              height: 0.5,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            FormProfile(
                input: dob,
                title: 'วันเกิดของฉัน',
                hintText: 'ระบุวันเกิดของคุณ'),
            Divider(
              height: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
