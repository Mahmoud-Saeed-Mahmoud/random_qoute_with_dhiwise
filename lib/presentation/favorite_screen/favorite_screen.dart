import 'package:flutter/material.dart';
import 'package:randomqoutegenerator/core/app_export.dart';
import 'package:randomqoutegenerator/presentation/favorite_screen/models/favorite_model.dart';
import 'package:randomqoutegenerator/widgets/app_bar/appbar_image.dart';
import 'package:randomqoutegenerator/widgets/app_bar/appbar_title.dart';
import 'package:randomqoutegenerator/widgets/app_bar/custom_app_bar.dart';
import 'package:randomqoutegenerator/widgets/custom_text_form_field.dart';

import '../favorite_screen/widgets/quotecontainer_item_widget.dart';
import 'controller/favorite_controller.dart';

class FavoriteScreen extends GetWidget<FavoriteController> {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
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
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      Container(
                          width: 353.h,
                          margin: EdgeInsets.only(
                              left: 20.h, top: 20.v, right: 20.h),
                          padding: EdgeInsets.symmetric(vertical: 14.v),
                          decoration: AppDecoration.fillOnPrimary.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder6),
                          child: CustomAppBar(
                              centerTitle: true,
                              title: Row(children: [
                                AppbarImage(
                                    svgPath: ImageConstant.imgArrowleft,
                                    onTap: () {
                                      onTapArrowleftone();
                                    }),
                                AppbarTitle(
                                    text: "msg_back_to_home_screen".tr,
                                    margin: EdgeInsets.only(
                                        left: 3.h, top: 1.v, bottom: 1.v))
                              ]))),
                      Expanded(
                          child: SizedBox(
                              width: double.maxFinite,
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.h, vertical: 10.v),
                                  child: Column(children: [
                                    CustomTextFormField(
                                        controller: controller.searchController,
                                        hintText: "msg_type_something_here".tr,
                                        hintStyle: theme.textTheme.titleLarge!,
                                        textInputAction: TextInputAction.done),
                                    SizedBox(height: 10.v),
                                    Expanded(
                                        child: Obx(() => ListView.separated(
                                            physics: BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            separatorBuilder: (context, index) {
                                              return SizedBox(height: 10.v);
                                            },
                                            itemCount: controller
                                                .filteredQoutes.length,
                                            itemBuilder: (context, index) {
                                              FavoriteModel model = controller
                                                  .filteredQoutes[index];
                                              return QuotecontainerItemWidget(
                                                  model);
                                            })))
                                  ]))))
                    ])))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }
}
