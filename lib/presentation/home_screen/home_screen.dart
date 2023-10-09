import 'package:flutter/material.dart';
import 'package:randomqoutegenerator/core/app_export.dart';
import 'package:randomqoutegenerator/data/models/getRandom/get_get_random_resp.dart';
import 'package:randomqoutegenerator/widgets/custom_elevated_button.dart';

import 'controller/home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment(0.5, 0),
                        end: Alignment(0.5, 1),
                        colors: [
                      appTheme.deepPurpleA700,
                      theme.colorScheme.primary
                    ])),
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 76.v,
                              width: 363.h,
                              child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                            margin:
                                                EdgeInsets.only(right: 10.h),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.h,
                                                vertical: 13.v),
                                            decoration: AppDecoration
                                                .fillOnPrimary
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .customBorderTL6),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(height: 3.v),
                                                  GestureDetector(
                                                      onTap: () {
                                                        navigateToFavScreen();
                                                      },
                                                      child: Text(
                                                          "msg_click_here_to_view"
                                                              .tr,
                                                          style: theme.textTheme
                                                              .headlineMedium))
                                                ]))),
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 11.h,
                                                vertical: 3.v),
                                            decoration: AppDecoration
                                                .fillOnPrimaryContainer
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .circleBorder16),
                                            child: Obx(
                                              () => Text(
                                                  controller.favCount.value
                                                      .toString(),
                                                  style: CustomTextStyles
                                                      .titleLargeOnPrimary_1),
                                            )))
                                  ])),
                          Container(
                              margin:
                                  EdgeInsets.fromLTRB(10.h, 10.v, 10.h, 5.v),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.h, vertical: 19.v),
                              decoration: AppDecoration.fillOnPrimary1.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.customBorderBL6),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                        width: 313.h,
                                        child: Obx(() => Text(
                                            controller.homeModelObj.value
                                                .quoteText.value,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify,
                                            style: theme
                                                .textTheme.headlineMedium))),
                                    Obx(() => Text(
                                        controller.homeModelObj.value.authorName
                                            .value,
                                        style: theme.textTheme.titleLarge)),
                                    SizedBox(height: 19.v),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomElevatedButton(
                                              width: 203.h,
                                              text: "msg_generate_another".tr,
                                              onTap: () {
                                                getRandomQoute();
                                              }),
                                          CustomImageView(
                                            svgPath: ImageConstant.imgFavorite,
                                            height: 32.adaptSize,
                                            width: 32.adaptSize,
                                            onTap: () async {
                                              final bool result =
                                                  await PrefUtils().saveQuoteId(
                                                      controller
                                                          .homeModelObj.value.id
                                                          .toString());
                                              if (result) {
                                                controller.favCount.value++;
                                              }
                                            },
                                          )
                                        ])
                                  ]))
                        ])))));
  }

  /// Navigates to the favoriteScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the favoriteScreen.
  navigateToFavScreen() {
    Get.toNamed(
      AppRoutes.favoriteScreen,
    );
  }

  /// calls the [{{BASE_URL}}/random?maxLength=150&minLength=100&tags=&author=&query=] API
  ///
  /// It has [GetGetRandomReq] as a parameter which will be passed as a API request body
  /// If the call is successful, the function calls the `_onGetRandomQouteSuccess()` function.
  /// If the call fails, the function calls the `_onGetRandomQouteError()` function.
  ///
  /// Throws a `NoInternetException` if there is no internet connection.
  Future<void> getRandomQoute() async {
    Map<String, dynamic> queryParams = {};
    try {
      await controller.callGetRandom(
        queryParams: queryParams,
      );
      _onGetRandomQouteSuccess();
    } on GetGetRandomResp {
      _onGetRandomQouteError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      //TODO: Handle generic errors
    }
  }

  void _onGetRandomQouteSuccess() {}
  void _onGetRandomQouteError() {}
}
