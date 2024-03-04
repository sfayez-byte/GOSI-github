import 'package:sanad5pages/presentation/iphone_13_14_twelve_page/iphone_13_14_twelve_page.dart';
import 'package:sanad5pages/widgets/custom_elevated_button.dart';
import 'package:sanad5pages/widgets/custom_bottom_app_bar.dart';
import 'package:sanad5pages/widgets/custom_floating_button.dart';
import '../another_pages/providers/main_provider.dart';
import 'models/iphone_13_14_twentysix_model.dart';
import 'package:flutter/material.dart';
import 'package:sanad5pages/core/app_export.dart';
import 'bloc/iphone_13_14_twentysix_bloc.dart';
import 'package:provider/provider.dart';

// ignore_for_file: must_be_immutable
class Iphone1314TwentysixScreen extends StatelessWidget {
  Iphone1314TwentysixScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<Iphone1314TwentysixBloc>(
        create: (context) => Iphone1314TwentysixBloc(Iphone1314TwentysixState(
            iphone1314TwentysixModelObj: Iphone1314TwentysixModel()))
          ..add(Iphone1314TwentysixInitialEvent()),
        child: Iphone1314TwentysixScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Iphone1314TwentysixBloc, Iphone1314TwentysixState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              body: Container(
                  width: SizeUtils.width,
                  height: SizeUtils.height,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.onPrimaryContainer,
                      image: DecorationImage(
                          image: AssetImage(ImageConstant.imgGroup36),
                          fit: BoxFit.cover)),
                  child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.h, vertical: 19.v),
                      child: ListView(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 348.h,
                                margin: EdgeInsets.only(left: 16.h),
                                child: Text("msg_hi_dear_don_t_forget".tr,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles
                                        .headlineSmallErrorContainer)),
                            SizedBox(height: 12.v),
                            _buildDailyGoal(context),
                            SizedBox(height: 7.v),
                            SizedBox(
                                height: MediaQuery.sizeOf(context).height * .27,
                                child: _buildTwentyTwo(context)),
                            SizedBox(height: 24.v),
                            _buildThirtyFive(context),
                            SizedBox(height: 25.v),
                            CustomElevatedButton(
                                height: 59.v,
                                text: "msg_have_you_been_injured".tr,
                                margin:
                                    EdgeInsets.only(left: 11.h, right: 12.h),
                                buttonStyle: CustomButtonStyles.fillPrimaryTL29,
                                buttonTextStyle: theme.textTheme.headlineSmall!,
                                onPressed: () {
                                  onTapHaveYouBeenInjured(context);
                                })
                          ]))),
              bottomNavigationBar: _buildBottomNavConcept(context),
              floatingActionButton:
                  Consumer<MainProvider>(builder: (__, prov, _) {
                return CustomFloatingButton(
                    height: 52,
                    width: 52,
                    onTap: () {
                      prov.pickVideo(context);
                    },
                    backgroundColor: theme.colorScheme.primary,
                    child: CustomImageView(
                        imagePath: ImageConstant.imgLinearVideo,
                        height: 26.0.v,
                        width: 26.0.h));
              }),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked));
    });
  }

  /// Section Widget
  Widget _buildDailyGoal(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 16.h, right: 19.h),
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 22.v),
            decoration: AppDecoration.fillOnError
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 2.v),
                      child: Text("lbl_daily_goal".tr,
                          style: theme.textTheme.headlineSmall)),
                  Padding(
                      padding: EdgeInsets.only(top: 1.v),
                      child: Text("lbl_0_0".tr,
                          style: theme.textTheme.headlineSmall))
                ])));
  }

  /// Section Widget
  Widget _buildTwentyTwo(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16.h, right: 24.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            flex: 2,
            child: Container(
                height: double.infinity,
                // padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 20.v),
                decoration: AppDecoration.outlineErrorContainer
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgImage44,
                          height: 60.adaptSize,
                          width: 60.adaptSize),
                      SizedBox(height: 10.v),
                      SizedBox(
                          width: 54.h,
                          child: Text("msg_its_the_perfect".tr,
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.labelLarge))
                    ])),
          ),
          Expanded(
            flex: 5,
            child: Padding(
                padding: EdgeInsets.only(left: 11.h),
                child: Column(children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                        // padding:
                        //     EdgeInsets.symmetric(horizontal: 26.h, vertical: 13.v),
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: AppDecoration.fillOnError.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgImage43,
                                  height: 45.v,
                                  // width: 40.h,
                                  margin: EdgeInsets.only(top: 7.v)),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 15.h, top: 20.v, bottom: 6.v),
                                  child: Text("lbl_0_0_cal".tr,
                                      style: theme.textTheme.titleLarge))
                            ])),
                  ),
                  SizedBox(height: 15.v),
                  Expanded(
                    flex: 3,
                    child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        // padding:
                        //     EdgeInsets.symmetric(horizontal: 21.h, vertical: 33.v),
                        decoration: AppDecoration.fillOnError.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder12),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgImage50,
                              height: 45.adaptSize,
                              width: 45.adaptSize,
                              radius: BorderRadius.circular(22.h),
                              margin: EdgeInsets.only(bottom: 1.v)),
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(15.h, 16.v, 17.h, 4.v),
                              child: Text("lbl_0_0_steps".tr,
                                  style: theme.textTheme.titleLarge))
                        ])),
                  )
                ])),
          )
        ]));
  }

  /// Section Widget
  Widget _buildThirtyFive(BuildContext context) {
    return SizedBox(
        height: 156.v,
        width: 329.h,
        child: Stack(alignment: Alignment.topCenter, children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                  margin: EdgeInsets.only(top: 1.v),
                  padding:
                      EdgeInsets.symmetric(horizontal: 21.h, vertical: 32.v),
                  decoration: AppDecoration.fillBlueGray.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder22),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle106,
                            height: 32.adaptSize,
                            width: 32.adaptSize,
                            radius: BorderRadius.circular(16.h),
                            margin: EdgeInsets.only(top: 57.v)),
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle87,
                            height: 32.adaptSize,
                            width: 32.adaptSize,
                            radius: BorderRadius.circular(16.h),
                            margin: EdgeInsets.only(left: 13.h, top: 57.v)),
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle8732x32,
                            height: 32.adaptSize,
                            width: 32.adaptSize,
                            radius: BorderRadius.circular(16.h),
                            margin: EdgeInsets.only(left: 13.h, top: 57.v)),
                        CustomImageView(
                            imagePath: ImageConstant.imgYellowBro1,
                            height: 33.adaptSize,
                            width: 33.adaptSize,
                            radius: BorderRadius.circular(16.h),
                            margin: EdgeInsets.only(left: 13.h, top: 56.v)),
                        Container(
                            width: 85.h,
                            margin: EdgeInsets.only(left: 24.h, top: 57.v),
                            child: Text("msg_don_t_miss_the_opportunity".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.labelLarge))
                      ]))),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  margin: EdgeInsets.only(bottom: 89.v),
                  padding: EdgeInsets.symmetric(vertical: 17.v),
                  decoration: AppDecoration.fillGray.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL21),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgRectangle8733x59,
                            height: 33.v,
                            width: 59.h,
                            radius: BorderRadius.circular(16.h)),
                        Padding(
                            padding: EdgeInsets.only(top: 10.v, bottom: 7.v),
                            child: Text("msg_a_specialized_course".tr,
                                style: theme.textTheme.labelLarge))
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildBottomNavConcept(BuildContext context) {
    return CustomBottomAppBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(context, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.iphone1314TwelvePage;
      case BottomBarEnum.Life:
        return "/";
      case BottomBarEnum.Calendar:
        return "/";
      case BottomBarEnum.Profile:
        return "profile";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.iphone1314TwelvePage:
        return Iphone1314TwelvePage.builder(context);
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the iphone1314TwelveContainerScreen when the action is triggered.
  onTapHaveYouBeenInjured(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => Iphone1314TwelvePage.builder(context)));

    // NavigatorService.pushNamed(
    //   AppRoutes.iphone1314TwelveContainerScreen,
    // );
  }
}
