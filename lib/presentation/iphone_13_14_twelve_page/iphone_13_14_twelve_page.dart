import 'package:sanad5pages/widgets/custom_elevated_button.dart';
import 'widgets/thirteen_item_widget.dart';
import 'models/thirteen_item_model.dart';
import 'models/iphone_13_14_twelve_model.dart';
import 'package:flutter/material.dart';
import 'package:sanad5pages/core/app_export.dart';
import 'bloc/iphone_13_14_twelve_bloc.dart';

// ignore_for_file: must_be_immutable
class Iphone1314TwelvePage extends StatelessWidget {
  const Iphone1314TwelvePage({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<Iphone1314TwelveBloc>(
      create: (context) => Iphone1314TwelveBloc(Iphone1314TwelveState(
        iphone1314TwelveModelObj: Iphone1314TwelveModel(),
      ))
        ..add(Iphone1314TwelveInitialEvent()),
      child: Iphone1314TwelvePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 697.v,
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgImage16,
                height: 797.v,
                width: 390.h,
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(alignment: Alignment.centerLeft,
                      child: CustomImageView(
                          imagePath: ImageConstant.imgArrowDown,
                          height: 20.adaptSize,
                          width: 20.adaptSize,
                          onTap: () => NavigatorService.goBack(),
                          margin: EdgeInsets.all(15)),
                    ),

                    // SizedBox(height: 21.v),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 629.v,
                        width: 373.h,
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            _buildTwentySix(context),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "msg_here_are_some_recommendations".tr,
                                // maxLines: 4,
                                softWrap: true,
                                // overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.titleLargeReadexPro,
                              ),
                            ),
                            _buildThirteen(context),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTwentySix(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(right: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 313.h,
              child: Text(
                "msg_if_you_need_further".tr,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleMediumReadexProErrorContainer,
              ),
            ),
            SizedBox(height: 23.v),
            Center(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: appTheme.gray500,
                  borderRadius: BorderRadius.circular(13.h),
                ),
                child: Text(
                  "msg_ministry_of_health".tr,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            // CustomElevatedButton(
            //   height: 36.v,
            //   // width: 200.h,
            //   text: "msg_ministry_of_health".tr,
            //   margin: EdgeInsets.only(right: 46.h),
            //   buttonStyle: CustomButtonStyles.fillGray,
            //   buttonTextStyle: theme.textTheme.headlineSmall!,
            //   alignment: Alignment.centerRight,
            // ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildThirteen(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
          top: 115.v,
          bottom: 137.v,
        ),
        child: BlocSelector<Iphone1314TwelveBloc, Iphone1314TwelveState,
            Iphone1314TwelveModel?>(
          selector: (state) => state.iphone1314TwelveModelObj,
          builder: (context, iphone1314TwelveModelObj) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 173.v,
                crossAxisCount: 2,
                mainAxisSpacing: 25.h,
                crossAxisSpacing: 10.h,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: iphone1314TwelveModelObj?.thirteenItemList.length ?? 0,
              itemBuilder: (context, index) {
                ThirteenItemModel model =
                    iphone1314TwelveModelObj?.thirteenItemList[index] ??
                        ThirteenItemModel(url: 'youtube.com');
                return ThirteenItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
