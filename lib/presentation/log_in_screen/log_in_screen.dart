import 'package:sanad5pages/widgets/custom_phone_number.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:sanad5pages/widgets/custom_elevated_button.dart';
import '../../main.dart';
import 'models/log_in_model.dart';
import 'package:flutter/material.dart';
import 'package:sanad5pages/core/app_export.dart';
import 'bloc/log_in_bloc.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<LogInBloc>(
        create: (context) => LogInBloc(LogInState(logInModelObj: LogInModel()))
          ..add(LogInInitialEvent()),
        child: LogInScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            body: Container(
                width: SizeUtils.width,
                height: SizeUtils.height,
                decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimaryContainer,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgGroup30),
                        fit: BoxFit.cover)),
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.h, vertical: 27.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // _buildStatusBarLight(context),
                          Spacer(flex: 15),
                          Padding(
                              padding: EdgeInsets.only(left: 12.h),
                              child: Text("lbl_welcome".tr,
                                  style: CustomTextStyles.displayMediumInter)),
                          SizedBox(height: 60.v),
                          Padding(
                              padding: EdgeInsets.only(left: 12.h),
                              child: Text("lbl_phone_number".tr,
                                  style: CustomTextStyles
                                      .titleSmallReadexProGray70001)),
                          SizedBox(height: 15.v),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.h),
                              child: BlocBuilder<LogInBloc, LogInState>(
                                  builder: (context, state) {
                                return CustomPhoneNumber(
                                    country: state.selectedCountry ??
                                        CountryPickerUtils
                                            .getCountryByPhoneCode('966'),
                                    controller: state.phoneNumberController,
                                    onTap: (_)=>null,
                                    // (Country value) {
                                    //   context.read<LogInBloc>().add(
                                    //       ChangeCountryEvent(value: value));
                                    // }
                                    );
                              })),
                          Spacer(flex: 72)
                        ]))),
            bottomNavigationBar: _buildLogin(context)));
  }

  /// Section Widget
  // Widget _buildStatusBarLight(BuildContext context) {
  //   return Padding(
  //       padding: EdgeInsets.only(left: 6.h),
  //       child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //         Text("lbl_9_41".tr, style: theme.textTheme.titleSmall),
  //         Spacer(),
  //         CustomImageView(
  //             imagePath: ImageConstant.imgSettings,
  //             height: 10.v,
  //             width: 17.h,
  //             margin: EdgeInsets.only(top: 4.v, bottom: 8.v)),
  //         CustomImageView(
  //             imagePath: ImageConstant.imgSettingsErrorcontainer,
  //             height: 10.v,
  //             width: 15.h,
  //             margin: EdgeInsets.only(left: 5.h, top: 4.v, bottom: 8.v)),
  //         CustomImageView(
  //             imagePath: ImageConstant.imgClose,
  //             height: 11.v,
  //             width: 25.h,
  //             margin: EdgeInsets.only(left: 5.h, top: 3.v, bottom: 8.v))
  //       ]));
  // }

  /// Section Widget
  Widget _buildLogin(BuildContext context) {
    return BlocBuilder<LogInBloc, LogInState>(
                                  builder: (context, state) {
                                return  CustomElevatedButton(
            text: "lbl_login".tr,
            margin: EdgeInsets.only(left: 31.h, right: 31.h, bottom: 33.v),
            onPressed: () {
              final phoneNum = state.phoneNumberController?.text ?? '';
              if(phoneNum.length != 9) return;
              onTapLogin(context, state.phoneNumberController!.text);
            });
      }
    );
  }

  /// Navigates to the otpScreen when the action is triggered.
  onTapLogin(BuildContext context, String phoneNum) async{
    await loading();
    NavigatorService.pushNamed(
      AppRoutes.otpScreen,
      arguments: phoneNum
    );
  }
}
