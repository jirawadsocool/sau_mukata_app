 import 'dart:io';
import 'package:flutter/material.dart';
 
class ShowBilUi extends StatefulWidget {
  final double? paytotal;
  final File? imgfile;
 
  const ShowBilUi({super.key, this.paytotal, this.imgfile});
 
  @override
  State<ShowBilUi> createState() => _ShowBilUiState();
}
 
class _ShowBilUiState extends State<ShowBilUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('Show Bill'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.imgfile != null)
              Image.file(
                widget.imgfile!,
                height: 120,
              ),
            SizedBox(height: 20),
            Text(
              'Total: ${widget.paytotal} บาท',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.file(
              widget.imgfile!,
              height: 200.0,
            )
          ],
        ),
      ),
    );
  }
}
 
 