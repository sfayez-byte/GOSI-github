import 'package:flutter/material.dart';
import 'package:sanad5pages/core/app_export.dart';
import 'package:sanad5pages/main.dart';
import 'package:sanad5pages/widgets/custom_elevated_button.dart';
import 'package:sanad5pages/widgets/custom_icon_button.dart';

class VideosScr extends StatelessWidget {
  static Widget builder(BuildContext context) => VideosScr();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                height: SizeUtils.height,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.center, children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgImage15,
                      height: 844.v,
                      width: 388.h,
                      alignment: Alignment.center),
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.h, vertical: 27.v),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgArrowDown,
                                    height: 20.adaptSize,
                                    width: 20.adaptSize,
                                    onTap: () => NavigatorService.goBack(),
                                    margin: EdgeInsets.only(left: 2.h)),
                                
                                Container(
                                    width: 263.h,
                                    margin: EdgeInsets.only(
                                        left: 12.h, right: 76.h),
                                    child: Text("Here are some recommendations for exercises that may help relieve pain from the injury:",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.displaySmall)),
                                
                                CustomElevatedButton(
                                  text: 'Progress',
                                  onPressed: ()=> loading(),
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  buttonStyle: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25)))),
                                )
                              ])))
                ]))));
  }
}
