import 'package:flutter/material.dart';
import 'package:randomqoutegenerator/core/app_export.dart';
import 'package:randomqoutegenerator/presentation/favorite_screen/models/favorite_model.dart';
import 'package:randomqoutegenerator/presentation/home_screen/controller/home_controller.dart';
import 'package:randomqoutegenerator/widgets/custom_outlined_button.dart';

import '../controller/favorite_controller.dart';

// ignore: must_be_immutable
class QuotecontainerItemWidget extends StatelessWidget {
  QuotecontainerItemWidget(
    this.quotecontainerItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FavoriteModel quotecontainerItemModelObj;

  var favController = Get.find<FavoriteController>();
  var homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 19.v,
      ),
      decoration: AppDecoration.fillOnPrimary1.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Obx(
            () => Text(
              quotecontainerItemModelObj.quoteText!.value,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              style: theme.textTheme.headlineMedium,
            ),
          ),
          Obx(
            () => Text(
              quotecontainerItemModelObj.authorName!.value,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleLarge,
            ),
          ),
          SizedBox(height: 19.v),
          CustomOutlinedButton(
            onTap: () async {
              final bool result = await PrefUtils()
                  .removeQuoteId(quotecontainerItemModelObj.id!.value);
              if (result) {
                favController.favoriteModelObj
                    .remove(quotecontainerItemModelObj);
                homeController.favCount.value--;
              }
            },
            text: "msg_remove_from_favorite".tr,
            leftIcon: Container(
              margin: EdgeInsets.only(right: 4.h),
              child: CustomImageView(
                svgPath: ImageConstant.imgFavoritePrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
