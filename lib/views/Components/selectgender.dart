import 'package:flutter/material.dart';

class SelectGender extends StatefulWidget {
  final String title;
  final String note;
  final String highlight;
  final String subnote;
  String gender;
  SelectGender(
      {Key? key,
      required this.title,
      required this.note,
      required this.highlight,
      required this.subnote,required this.gender})
      : super(key: key);

  @override
  _SelectGenderState createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  int index = 0;
  var currentindex = 0;
  String currentgender = 'ผู้ชาย';

   select_gender(String gender, int index) {
    setState(() {
      currentindex = index;
      currentgender = gender;
      widget.gender = currentgender;
    });
    print(widget.gender);
    return widget.gender;
  }

  Widget gender(String value, Color color, int index, IconData icons) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        // padding: EdgeInsets.only(top: 10, bottom: 10),
        child: FlatButton(
            color: currentindex == index ? color : Colors.grey[200],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              select_gender(value, index);
              // print(currentgender);
            },
            child: Container(
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  Icon(icons,
                      color: currentindex == index ? Colors.white : color),
                  Text(
                    value,
                    style: TextStyle(
                        color: currentindex == index ? Colors.white : color),
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
      color: Colors.white,
      height: size.height * 0.26,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 0, 10),
            child: Row(children: [
              
              Text(
                widget.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],),
          ),
          // ListTile(
          //   title: Text(
          //     widget.title,
          //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          //   ),
          // ),
          Row(
            children: [
              gender("ผู้ชาย", Colors.blue, 0, Icons.male),
              gender("ผู้หญิง", Colors.pink, 1, Icons.female),
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Wrap(
              children: [
                RichText(
                  text: TextSpan(
                    text: widget.note,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black38,
                      fontFamily: 'Prompt',
                    ),
                    children: [
                      TextSpan(
                          text: widget.highlight,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.pink,
                            fontFamily: 'Prompt',
                          )),
                      TextSpan(
                          text: widget.subnote,
                          style: TextStyle(
                            fontFamily: 'Prompt',
                            color: Colors.black38,
                            fontSize: 14,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
