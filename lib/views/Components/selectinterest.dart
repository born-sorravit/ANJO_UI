import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  List select = [];
  String _gender  = 'เพศของคุณ';
  String _interest = 'เพศที่สนใจ';

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
                                text: "$_gender | $_interest ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Prompt',
                                  color: Colors.black38,
                                ),
                              ),
                              WidgetSpan(
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () async {
                          select = await Get.bottomSheet(
                            BottomSheetInterest(),
                            isDismissible: false,
                          );
                          setState(() {
                            _interest = select[0];
                            _gender = select[1];
                          });
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
