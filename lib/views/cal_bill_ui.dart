import 'package:dti_monry_share/views/home_ui.dart';
import 'package:dti_monry_share/views/show_bill_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
 
class CalBillUi extends StatefulWidget {
  const CalBillUi({super.key});
 
  @override
  State<CalBillUi> createState() => _CalBillUiState();
}
 
class _CalBillUiState extends State<CalBillUi> {
  File? imgfile;
 
  List<String> membertype = [
    'ไม่เป็นสมาชิก',
    'สมาชิกทั่วไปลด 5 %',
    'สมาชิกVIP 20 %'
  ];
 
  double discount = 0;
 
  bool adultCheck = false;
  bool childCheck = false;
 
  TextEditingController adultcrtl = TextEditingController(text: '0');
  TextEditingController childcrtl = TextEditingController(text: '0');
  TextEditingController cokectrl = TextEditingController(text: '0');
  TextEditingController purectrl = TextEditingController(text: '0');
 
  int watercheck = 1;
 
  Future<void> openCamera() async {
    final picker = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 75);
 
    if (picker == null) return;
 
    setState(() {
      imgfile = File(picker.path);
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 35,
            right: 35,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    openCamera();
                  },
                  child: imgfile == null
                      ? Image.asset(
                          'assets/images/camera.jpg',
                          height: 120,
                        )
                      : Image.file(
                          imgfile!,
                          height: 120,
                        ),
                ),
                SizedBox(height: 35),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนคน',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (valueParam) {
                        setState(
                          () {
                            adultCheck = valueParam!;
                            if (valueParam! == false) {
                              adultcrtl.text = '0';
                            }
                          },
                        );
                      },
                      value: adultCheck,
                    ),
                    Text(
                      'ผู้ใหญ่ 239 บาท/คน จำนวน  ',
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: adultCheck,
                        controller: adultcrtl,
                      ),
                    ),
                    Text('คน'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (valueParam) {
                        setState(
                          () {
                            childCheck = valueParam!;
                            if (valueParam! == false) {
                              childcrtl.text = '0';
                            }
                          },
                        );
                      },
                      value: childCheck,
                    ),
                    Text(
                      'เด็ก 69 บาท/คน จำนวน   ',
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: childCheck,
                        controller: childcrtl,
                      ),
                    ),
                    Text('คน'),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'บุฟเฟต์น้ำดื่ม',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      onChanged: (valueParam) {
                        setState(() {
                          watercheck = valueParam!;
                          if (watercheck == 1) {
                            cokectrl.text = '0';
                            purectrl.text = '0';
                          }
                        });
                      },
                      value: 1,
                      groupValue: watercheck,
                    ),
                    Text('รับ 25 บาท/หัว')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      onChanged: (valueParam) {
                        setState(() {
                          watercheck = valueParam!;
                        });
                      },
                      value: 2,
                      groupValue: watercheck,
                    ),
                    Text('ไม่รับ')
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Text(
                      '          โค้ก 20 บาท/ขวด จำนวน   ',
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: watercheck == 1 ? false : true,
                        controller: cokectrl,
                      ),
                    ),
                    Text('ขวด'),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '          น้ำเปล่า 15 บาท/ขวด จำนวน    ',
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: watercheck == 1 ? false : true,
                        controller: purectrl,
                      ),
                    ),
                    Text('ขวด'),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ประเภทสมาชิก',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                DropdownButton(
                  value: discount,
                  isExpanded: true,
                  items: membertype
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(e),
                          value: membertype.indexOf(e).toDouble(),
                        ),
                      )
                      .toList(),
                  onChanged: (valueParam) {
                    switch (valueParam) {
                      case 0:
                        discount = 0;
                        break;
                      case 1:
                        discount = 0.05;
                        break;
                      case 2:
                        discount = 0.2;
                        break;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (imgfile == null) {
                            // Handle the case when the image is not selected
                          } else if (adultCheck == true &&
                              (adultcrtl.text == '0' ||
                                  adultcrtl.text.isEmpty)) {
                            // Handle invalid input for adults
                          } else if (childCheck == true &&
                              (childcrtl.text == '0' ||
                                  childcrtl.text.isEmpty)) {
                            // Handle invalid input for children
                          } else {
                            int adult = int.parse(adultcrtl.text);
                            int child = int.parse(childcrtl.text);
                            int coke = int.parse(cokectrl.text);
                            int pure = int.parse(purectrl.text);
 
                            double paywaterbuffet =
                                watercheck == 1 ? 25.0 * (adult + child) : 0;
 
                            double paytotal = (299.0 * adult) +
                                (69.0 * child) +
                                (20.0 * coke) +
                                (15.0 * pure) +
                                paywaterbuffet;
 
                            // Apply the discount
                            paytotal = paytotal - (paytotal * discount);
 
                            // Navigate to the next page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowBilUi(
                                  paytotal: paytotal,
                                  imgfile: imgfile,
                                ),
                              ),
                            );
                          }
                        },
                        icon: Icon(
                          Icons.calculate,
                        ),
                        label: Text('คำนวณเงิน'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel,
                        ),
                        label: Text('ยกเลิก'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 