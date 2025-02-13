import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuUi extends StatefulWidget {
  const MenuUi({super.key});

  @override
  State<MenuUi> createState() => _MenuUiState();
}

class _MenuUiState extends State<MenuUi> {
  List<String> menushow = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
    'assets/images/img6.png',
    'assets/images/img7.png',
  ];
List<String> branchShop = [
    'assets/images/shop1.png',
    'assets/images/shop2.png',
    'assets/images/shop3.png',
    'assets/images/shop4.png',
    'assets/images/shop5.png',
  ];

List<String> shoplocation = [
    'https://www.google.com/maps/@14.107339,100.5328975,3018m',
    'https://www.google.com/maps/@14.4631925,100.3556163,3018m',
    'https://www.google.com/maps/@14.2369823,101.0446829,3018m',
    'https://www.google.com/maps/@14.9207436,100.1701784,3018m',
    'https://www.google.com/maps/@14.90462,103.2610903,3018m',
];

 Future<void> _launchInBrowserView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
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
            'assets/images/logo.png',
            width: 250,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'เมนูเด็ดๆ',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            margin: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: menushow.length,
              itemBuilder: (context , index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      menushow[index]
                    )
                  ),
                );
              }
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'ร้านในเครือ',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: branchShop.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: 35,
                    right: 35,
                    bottom: 15,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      onTap: () {
                        _launchInBrowserView(Uri.parse(shoplocation[index]));
                      },
                      child: Image.asset(
                        branchShop[index],
                      ),
                    ),
                  ),
                );
              }
            ),
          )
        ],
      ),
     ),
    );
  }
}