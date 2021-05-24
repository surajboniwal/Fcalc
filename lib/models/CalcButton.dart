import 'package:flutter/material.dart';
import 'package:flutter_calc/controllers/calculator.dart';
import 'package:flutter_calc/themes/apptheme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

List<Widget> buttons = [
  //First row
  Button(
    isIcon: false,
    val: 'AC',
    color: Colors.blueAccent,
    id: 'ac',
  ),
  Button(
    isIcon: true,
    val: 'assets/ic_plus_minus.svg',
    color: Colors.blueAccent,
    id: 'pn',
  ),

  Button(
    isIcon: true,
    val: 'assets/ic_percent.svg',
    color: Colors.blueAccent,
    id: 'percent',
  ),

  Button(
    isIcon: true,
    val: 'assets/ic_divide.svg',
    color: Colors.redAccent,
    id: 'divide',
  ),

  //Second row

  Button(
    isIcon: false,
    val: '7',
    id: '7',
  ),

  Button(
    isIcon: false,
    val: '8',
    id: '8',
  ),

  Button(
    isIcon: false,
    val: '9',
    id: '9',
  ),

  Button(
    isIcon: true,
    val: 'assets/ic_multiply.svg',
    color: Colors.redAccent,
    id: 'multiply',
  ),

  //Third row

  Button(
    isIcon: false,
    val: '4',
    id: '4',
  ),

  Button(
    isIcon: false,
    val: '5',
    id: '5',
  ),

  Button(
    isIcon: false,
    val: '6',
    id: '6',
  ),

  Button(
    isIcon: true,
    val: 'assets/ic_subtract.svg',
    color: Colors.redAccent,
    id: 'subtract',
  ),

  //Fourth row

  Button(
    isIcon: false,
    val: '1',
    id: '1',
  ),

  Button(
    isIcon: false,
    val: '2',
    id: '2',
  ),

  Button(
    isIcon: false,
    val: '3',
    id: '3',
  ),

  Button(
    isIcon: true,
    val: 'assets/ic_add.svg',
    color: Colors.redAccent,
    id: 'add',
  ),

  //Fifth row

  Button(
    isIcon: true,
    val: 'assets/ic_backspace.svg',
    id: 'backspace',
  ),

  Button(
    isIcon: false,
    val: '0',
    id: '0',
  ),

  Button(
    isIcon: false,
    val: '.',
    id: 'fullstop',
  ),

  Button(
    isIcon: true,
    val: 'assets/ic_equal.svg',
    color: Colors.redAccent,
    id: 'equal',
  ),
];

class Button extends StatelessWidget {
  final bool isIcon;
  final String val;
  final String id;
  final Color? color;

  final CalcController _calcController = Get.find<CalcController>();

  Button({
    Key? key,
    required this.val,
    required this.isIcon,
    this.color,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          _calcController.buttonPress(id);
        },
        child: Container(
          margin: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Center(
            child: isIcon
                ? SvgPicture.asset(
                    val,
                    width: 26,
                    color: color == null ? Theme.of(context).textTheme.bodyText1!.color : color,
                  )
                : Text(
                    val,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
          ),
        ),
      ),
    );
  }
}

List<Widget> getButtonRow(int start) {
  return buttons.getRange(start, start + 4).toList();
}
