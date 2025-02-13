import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:dti_monry_share/views/about_ui.dart';
import 'package:dti_monry_share/views/cal_bill_ui.dart';
import 'package:dti_monry_share/views/menu_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 
class HoemUi extends StatefulWidget {
  const HoemUi({super.key});
 
  @override
  State<HoemUi> createState() => _HoemUiState();
}
 
class _HoemUiState extends State<HoemUi> {
  NotchBottomBarController _pageController = NotchBottomBarController(index: 1);
 
  List<Widget> viewInBody = [CalBillUi(), MenuUi(), AboutUi()];
 
  int indexShow = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'I love You',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        onTap: (valuePares) {
          setState(() {
            indexShow = valuePares;
          });
        },
        kIconSize: 24,
        kBottomRadius: 20,
        notchColor: Colors.deepOrange,
        color: Colors.deepOrange,
        notchBottomBarController: _pageController,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: Colors.white,
            ),
            itemLabel: 'คิดเงิน ',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              FontAwesomeIcons.hollyBerry,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              FontAwesomeIcons.hollyBerry,
              color: Colors.white,
            ),
            itemLabel: 'MENU ',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              FontAwesomeIcons.stackExchange,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              FontAwesomeIcons.stackExchange,
              color: Colors.white,
            ),
            itemLabel: 'About ',
          ),
        ],
      ),
      body: viewInBody[indexShow],
    );
  }
}