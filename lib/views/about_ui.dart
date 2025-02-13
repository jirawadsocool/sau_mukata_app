import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/saulogo.png',
              width: 150.0,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Tech SAU Buffet',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'แอปพลิเคชั่นร้านหมูกะทะ\nเพื่อคนไทย\nสนใจแอปพลิเคชั่นติดต่อ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'เด็กไอที SAUDTI',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                _makePhoneCall('0957030247');
              },
              child: Image.asset(
                'assets/images/sauqr.png',
                width: 150.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}