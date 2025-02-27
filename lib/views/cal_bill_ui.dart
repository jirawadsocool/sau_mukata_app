import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CalBillUi extends StatefulWidget {
  const CalBillUi({super.key});

  @override
  State<CalBillUi> createState() => _CalBillUiState();
}

class _CalBillUiState extends State<CalBillUi> {
  File? imgfile;

  Future<void> openCamera() async {
    final picker = await ImagePicker().pickImage(
      source: ImageSource.camera,imageQuality: 75,
    );

    if (picker != null) return;

    setState(() {
      imgfile = File(picker!.path);
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
                    openCamera();},
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
                SizedBox(
                  height: 35,
                ),
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
                    onChanged: (ValueParam) {},
                    value: false,
                    ),
                    Text(
                      'ผู้ใหญ่ 239/คน',
                    ),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                    prefix: Text('จำนวน'),
                    suffix: Text('คน'),
                    ),
                ),
                Row(
                  children: [
                    Checkbox(
                    onChanged: (ValueParam) {},
                    value: false,
                    ),
                    Text(
                      'เด็ก 69 บาท/คน',
                    ),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                    prefix: Text('จำนวน'),
                    suffix: Text('คน'),
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}