import 'dart:async';

import 'package:sanad5pages/main.dart';
import 'package:sanad5pages/widgets/custom_pin_code_text_field.dart';
import 'package:sanad5pages/widgets/custom_elevated_button.dart';
import 'models/otp_model.dart';
import 'package:flutter/material.dart';
import 'package:sanad5pages/core/app_export.dart';
import 'bloc/otp_bloc.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<OtpBloc>(
        create: (context) =>
            OtpBloc(OtpState(otpModelObj: OtpModel()))..add(OtpInitialEvent()),
        child: OtpScreen());
  }

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var sec = 20;
  timer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      sec--;
      setState(() {});
      if (sec == 0) timer.cancel();
    });
  }
  

  @override
  void initState() {
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {
    final phoneNum = ModalRoute.of(context)!.settings.arguments as String;
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
                                // _buildStatusBarLight(context),
                                // BackButton(),
                                // SizedBox(height: 2.v),
                                CustomImageView(
                                    imagePath: ImageConstant.imgArrowDown,
                                    height: 20.adaptSize,
                                    width: 20.adaptSize,
                                    onTap: () => NavigatorService.goBack(),
                                    margin: EdgeInsets.only(left: 2.h)),
                                Spacer(flex: 29),
                                Padding(
                                    padding: EdgeInsets.only(left: 12.h),
                                    child: Text("lbl_otp".tr,
                                        style: theme.textTheme.displayMedium)),
                                SizedBox(height: 62.v),
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        width: 318.h,
                                        margin: EdgeInsets.only(
                                            left: 12.h, right: 21.h),
                                        child: Text(
                                            "msg_enter_the_verification".tr +
                                                phoneNum.substring(
                                                    phoneNum.length - 3),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: CustomTextStyles
                                                .titleSmallReadexProGray7000114))),
                                SizedBox(height: 21.v),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 12.h, right: 11.h),
                                    child: BlocSelector<OtpBloc, OtpState,
                                            TextEditingController?>(
                                        selector: (state) =>
                                            state.otpController,
                                        builder: (context, otpController) {
                                          return CustomPinCodeTextField(
                                              context: context,
                                              controller: otpController,
                                              onChanged: (value) {
                                                otpController?.text = value;
                                              });
                                        })),
                                SizedBox(height: 32.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 95.h),
                                    child: InkWell(
                                      onTap: sec == 0 ? ()async{
                                        await loading();
                                        sec = 20;
                                        setState(() {});
                                        timer();
                                      } : null,
                                      child: Row(children: [
                                        Text("lbl_resend_code".tr,
                                            style: theme.textTheme.titleMedium),
                                        Padding(
                                            padding: EdgeInsets.only(left: 11.h),
                                            child: Text('00:$sec',
                                                style: CustomTextStyles
                                                    .bodyLargeSomarPrimary))
                                      ]),
                                    )),
                                Spacer(flex: 70),
                                SizedBox(height: 4.v),
                                CustomElevatedButton(
                                    height: 62.v,
                                    text: "lbl_verify".tr,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12.h),
                                    onPressed: () {
                                      onTapVerify(context);
                                    },
                                    alignment: Alignment.center)
                              ])))
                ]))));
  }

  /// Section Widget
  Widget _buildStatusBarLight(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_9_41".tr, style: theme.textTheme.titleSmall),
          Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgSettings,
              height: 10.v,
              width: 17.h,
              margin: EdgeInsets.only(top: 4.v, bottom: 8.v)),
          CustomImageView(
              imagePath: ImageConstant.imgSettingsErrorcontainer,
              height: 10.v,
              width: 15.h,
              margin: EdgeInsets.only(left: 5.h, top: 4.v, bottom: 8.v)),
          CustomImageView(
              imagePath: ImageConstant.imgClose,
              height: 11.v,
              width: 25.h,
              margin: EdgeInsets.only(left: 5.h, top: 3.v, bottom: 8.v))
        ]));
  }

  /// Navigates to the signUpScreen when the action is triggered.
  onTapVerify(BuildContext context) async{
    await loading();
    NavigatorService.pushNamed(
      AppRoutes.signUpScreen,
    );
  }
}
