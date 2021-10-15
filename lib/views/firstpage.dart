import 'package:anjo_ui/views/secondpage.dart';
import 'package:anjo_ui/views/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Components/ButtonSubmit.dart';
import 'Components/InputDOB.dart';
import 'Components/InputText.dart';
import 'Components/MyBirthDay.dart';
import 'package:intl/intl.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final validation = GlobalKey<FormState>();
  final name = TextEditingController();
  final inputID = TextEditingController();
  final day = TextEditingController();
  final month = TextEditingController();
  final year = TextEditingController();
  String textValidation = '';
  DateTime? date;

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date ?? now,
        firstDate: DateTime(1970),
        lastDate: now);
    if (picked != null && picked != date) {
      setState(() {
        day.text = DateFormat('dd').format(picked);
        month.text = DateFormat('MM').format(picked);
        year.text = DateFormat('yyyy').format(picked);
      });
    }
  }

  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {},
          ),
          centerTitle: true,
          title: const Text(
            "สร้างบัญชี",
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
                InputText(
                  size: size,
                  input: name,
                  hintText: 'โปรดระบุชื่อ',
                  title: 'ชื่อของฉัน',
                  note:
                      'นี่คือชื่อที่จะปรากฎบนโปรไฟล์ของคุณ และจะไม่สามารถเปลี่ยนแปลงภายหลังได้',
                  icon: Icon(null),
                  textvalidate: 'โปรดระบุชื่อของคุณ',
                  length: 50,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                InputText(
                  size: size,
                  input: inputID,
                  hintText: 'โปรดระบุไอดี',
                  title: 'ANJO ID',
                  note:
                      'คุณสามารถใช้ ANJO ID เพื่อระบุตัวตนและให้ผู้ใช้คนอื่นเพิ่มเพื่อน ซึ่งไม่สามารถเปลี่ยนแปลงภายหลังได้',
                  icon: Icon(Icons.check, color: Colors.pink, size: 20),
                  textvalidate: 'โปรดระบุไอดี',
                  length: 50,
                ),
                Divider(height: 0.5),
                Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      "อนุญาติให้เพิ่มเพื่อนด้วย ID",
                      style: TextStyle(fontWeight: FontWeight.bold),
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
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          "วันเกิดของฉัน",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.calendar_today,
                            size: 20,
                          ),
                          onPressed: () {
                            _selectDate(context);
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InputDOB(
                            size: size,
                            input: day,
                            hintText: 'วัน',
                            width: 0.17,
                            textvalidate: textValidation,
                          ),
                          InputDOB(
                            size: size,
                            input: month,
                            hintText: 'เดือน',
                            width: 0.2,
                            textvalidate: textValidation,
                          ),
                          InputDOB(
                            size: size,
                            input: year,
                            hintText: 'ปี',
                            width: 0.2,
                            textvalidate: textValidation,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      ListTile(
                        title: Text(
                          "หลังจากลงทะเบียนแล้ว คุณไม่สามารถแก้ไขวันเกิดของคุณได้กรุณาตรวจสอบวันเกิดของคุณให้ถูกต้อง",
                          style: TextStyle(fontSize: 14, color: Colors.black38),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonSubmit(
                        page: SecondPage(
                          anjo_id: inputID,
                          name: name,
                          day: day,
                          month: month,
                          year: year,
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
        ));
  }
}
