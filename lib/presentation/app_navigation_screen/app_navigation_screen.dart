import 'controller/app_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:randomqoutegenerator/core/app_export.dart';

class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            body: SizedBox(
                width: 375.h,
                child: Column(children: [
                  Container(
                      decoration: AppDecoration.fillWhiteA,
                      child: Column(children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.h, vertical: 10.v),
                                child: Text("lbl_app_navigation".tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: appTheme.black900,
                                        fontSize: 20.fSize,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400)))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 20.h),
                                child: Text("msg_check_your_app_s".tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: appTheme.blueGray40001,
                                        fontSize: 16.fSize,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400)))),
                        SizedBox(height: 5.v),
                        Divider(
                            height: 1.v,
                            thickness: 1.v,
                            color: appTheme.black900)
                      ])),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              decoration: AppDecoration.fillWhiteA,
                              child: Column(children: [
                                GestureDetector(
                                    onTap: () {
                                      onTapHomescreen();
                                    },
                                    child: Container(
                                        decoration: AppDecoration.fillWhiteA,
                                        child: Column(children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.h,
                                                      vertical: 10.v),
                                                  child: Text(
                                                      "lbl_home_screen".tr,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              appTheme.black900,
                                                          fontSize: 20.fSize,
                                                          fontFamily: 'Roboto',
                                                          fontWeight: FontWeight
                                                              .w400)))),
                                          SizedBox(height: 5.v),
                                          Divider(
                                              height: 1.v,
                                              thickness: 1.v,
                                              color: appTheme.blueGray40001)
                                        ]))),
                                GestureDetector(
                                    onTap: () {
                                      onTapFavoritescreen();
                                    },
                                    child: Container(
                                        decoration: AppDecoration.fillWhiteA,
                                        child: Column(children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.h,
                                                      vertical: 10.v),
                                                  child: Text(
                                                      "lbl_favorite_screen".tr,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              appTheme.black900,
                                                          fontSize: 20.fSize,
                                                          fontFamily: 'Roboto',
                                                          fontWeight: FontWeight
                                                              .w400)))),
                                          SizedBox(height: 5.v),
                                          Divider(
                                              height: 1.v,
                                              thickness: 1.v,
                                              color: appTheme.blueGray40001)
                                        ])))
                              ]))))
                ]))));
  }

  /// Navigates to the homeScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the homeScreen.
  onTapHomescreen() {
    Get.toNamed(
      AppRoutes.homeScreen,
    );
  }

  /// Navigates to the favoriteScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the favoriteScreen.
  onTapFavoritescreen() {
    Get.toNamed(
      AppRoutes.favoriteScreen,
    );
  }
}
