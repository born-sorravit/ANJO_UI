import 'package:flutter/material.dart';
import 'BottomSheet.dart';

class SelectInterest extends StatefulWidget {
  SelectInterest({Key? key}) : super(key: key);

  @override
  _SelectInterestState createState() => _SelectInterestState();
}

class _SelectInterestState extends State<SelectInterest> {
  int index_interest = 0;
  var currentindex_interest = 0;
  String currentInterest = '';

  void select_interest(int index_interest) {
    setState(() {
      currentindex_interest = index_interest;
    });
  }

  Widget interest(String value, int index_interest, Color color_interest) {
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
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "เพศของฉัน",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: TextButton(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "ผู้ชาย | ชอบเพศตรงข้าม ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Prompt',
                                  color: Colors.black38,
                                ),
                              ),
                              WidgetSpan(
                                child: Icon(Icons.arrow_forward_ios, size: 18 , color: Colors.black45,),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) => BottomSheetInterest(),
                          );
                        }),
                  ),
                  

                  // Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// builder: (Null) => Container(
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.vertical(
//                                           top: Radius.circular(20))),
//                                   height: 400,
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       Container(
//                                         padding:
//                                             EdgeInsets.fromLTRB(15, 10, 15, 10),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Text(
//                                               "เพศของคุณ",
//                                               style: TextStyle(
//                                                 fontSize: 14,
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                             ),
//                                             TextButton(
//                                               child: Text(
//                                                 "ยกเลิก",
//                                                 style: TextStyle(
//                                                   fontSize: 14,
//                                                   color: Colors.black54,
//                                                   fontWeight: FontWeight.w300,
//                                                 ),
//                                               ),
//                                               onPressed: () =>
//                                                   Navigator.pop(context),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Container(
//                                         width: size.width * 0.9,
//                                         height: 60,
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           color: Colors.grey.shade300,
//                                         ),
//                                         child: Row(
//                                           children: [
//                                             interest("ผู้ชาย", 0, Colors.pink),
//                                             interest("ผู้หญิง", 1, Colors.pink),
//                                             interest("ไบนารี่", 2, Colors.pink),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );