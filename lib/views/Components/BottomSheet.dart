import 'package:anjo_ui/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class BottomSheetInterest extends StatefulWidget {
  @override
  _BottomSheetInterestState createState() => _BottomSheetInterestState();
}

class _BottomSheetInterestState extends State<BottomSheetInterest> {
  int index_interest = 0;
  var currentindex_interest = 0;
  String _interest = '';
  String _gender = '';


  void select_interest(int index_interest) {
    setState(() {
      currentindex_interest = index_interest;
    });
    print(currentindex_interest);
  }

  final listInterest = [
    CheckBokState(title: 'ชอบเพศตรงข้าม'),
    CheckBokState(title: 'เกย์'),
    CheckBokState(title: 'ไบเซกซ์ชัวล์'),
    CheckBokState(title: 'ทรานส์เจนเดอร์'),
    CheckBokState(title: 'เควียร์'),
  ];

  Widget interest(
    String value,
    int index_interest,
    Color color_interest,
  ) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(top: 7, bottom: 7),
        child: FlatButton(
            color: currentindex_interest == index_interest
                ? color_interest
                : Colors.grey.shade300,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              select_interest(index_interest);
              setState(() {
                _gender = value;
              });
              print(_gender);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    value,
                    style: TextStyle(
                        fontSize: 14,
                        color: currentindex_interest == index_interest
                            ? Colors.white
                            : Colors.grey.shade600),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      height: 400,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: ListTile(
                title: Text(
                  "เพศของคุณ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontFamily: 'Prompt',
                  ),
                ),
                trailing: TextButton(
                  child: Text(
                    "บันทึก",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontFamily: 'Prompt',
                    ),
                  ),
                  
                  onPressed: () async => 
                  Get.back(result:[_interest , _gender])
                ),
              )),
          Container(
            width: size.width * 0.9,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade300,
            ),
            child: Row(
              children: [
                interest("ผู้ชาย", 0, Colors.pink),
                interest("ผู้หญิง", 1, Colors.pink),
                interest("ไบนารี่", 2, Colors.pink),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              ...listInterest.map(buildSingleCheckBox).toList(),
            ],
          )
        ],
      ),
    );
  }
    // Controller c = Get.put(Controller());
  Widget buildSingleCheckBox(CheckBokState checkbox) => 
      Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                children: [
                  Card(
                      elevation: 0,
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                      color:
                          checkbox.value == true ? Colors.white : Colors.white,
                      child: ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -2),
                        title: Text(
                          checkbox.title,
                          style: TextStyle(
                            color: checkbox.value == true
                                ? Colors.pink
                                : Colors.black87,
                          ),
                        ),
                        trailing: checkbox.value == true
                            ? Icon(
                                Icons.check,
                                color: Colors.pink,
                              )
                            : Icon(null),
                        onTap: () {
                          setState(() {
                            checkbox.value = !checkbox.value;
                            // c.a.value = checkbox.title;
                            // print(c.a.obs);
                            _interest = checkbox.title;
                            print(checkbox.value);
                            // checkbox.value = false;
                          });
                        },
                      )),
                  Divider(height: 0.5),
                ],
              ),
            ),
          )
        ],
      );
}

// class Controller extends GetxController {

//   RxString a = ''.obs;

//   // void test(){
//   //   a.value = ;
//   // }
// }
