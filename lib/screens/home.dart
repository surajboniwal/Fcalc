import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calc/controllers/calculator.dart';
import 'package:flutter_calc/models/CalcButton.dart';
import 'package:flutter_calc/themes/apptheme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final CalcController _calcController = Get.find<CalcController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  EasyDynamicTheme.of(context).changeTheme(dark: false);
                                },
                                child: Icon(
                                  Icons.wb_sunny_outlined,
                                  size: 28.0,
                                  color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark ? AppColors.buttonTextColorDark.withOpacity(0.2) : AppColors.buttonTextColorLight,
                                ),
                              ),
                              Container(
                                height: 25.0,
                                child: VerticalDivider(
                                  thickness: 2.0,
                                  width: 20.0,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  EasyDynamicTheme.of(context).changeTheme(dark: true);
                                },
                                child: Icon(
                                  Icons.nightlight_outlined,
                                  size: 28.0,
                                  color: EasyDynamicTheme.of(context).themeMode == ThemeMode.light ? AppColors.buttonTextColorLight.withOpacity(0.2) : AppColors.buttonTextColorDark,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  child: Text(
                                    _calcController.firstDigit.toString(),
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                          fontSize: 24.0,
                                        ),
                                  ),
                                ),
                                _calcController.methodSign.value == ''
                                    ? Container()
                                    : SvgPicture.asset(
                                        _calcController.methodSign.value,
                                        width: 16,
                                        color: Theme.of(context).textTheme.bodyText1!.color,
                                      ),
                                Text(
                                  _calcController.secondDigit.toString(),
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontSize: 24.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Obx(
                            () => _calcController.result.value != ''
                                ? Text(
                                    _calcController.result.value,
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                          fontSize: 48.0,
                                          letterSpacing: 2.0,
                                        ),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          ...getButtonRow(0)
                              .map(
                                (button) => Container(
                                  child: button,
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          ...getButtonRow(4)
                              .map(
                                (button) => Container(
                                  child: button,
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          ...getButtonRow(8)
                              .map(
                                (button) => Container(
                                  child: button,
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          ...getButtonRow(12)
                              .map(
                                (button) => Container(
                                  child: button,
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          ...getButtonRow(16)
                              .map(
                                (button) => Container(
                                  child: button,
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
