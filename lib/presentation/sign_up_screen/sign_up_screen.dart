import 'package:sanad5pages/main.dart';
import 'package:sanad5pages/widgets/custom_icon_button.dart';
import 'package:sanad5pages/widgets/custom_text_form_field.dart';
import 'package:sanad5pages/widgets/custom_elevated_button.dart';
import 'models/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:sanad5pages/core/app_export.dart';
import 'bloc/sign_up_bloc.dart';

enum Gender {
  male,
  female,
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SignUpBloc>(
        create: (context) =>
            SignUpBloc(SignUpState(signUpModelObj: SignUpModel()))
              ..add(SignUpInitialEvent()),
        child: SignUpScreen());
  }

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  DateTime? ageDate;
  Gender gender = Gender.female;

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
                      imagePath: ImageConstant.imgImage23,
                      height: 841.v,
                      width: 390.h,
                      alignment: Alignment.center),
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 18.h),
                          child: ListView(
                              // mainAxisSize: MainAxisSize.min,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // _buildStatusBarLight(context),
                                SizedBox(height: 1.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 6.h),
                                    child: CustomIconButton(
                                        height: 20.adaptSize,
                                        width: 20.adaptSize,
                                        child: CustomImageView())),
                                SizedBox(height: 51.v),
                                Container(
                                    width: 263.h,
                                    margin: EdgeInsets.only(
                                        left: 12.h, right: 76.h),
                                    child: Text("msg_tell_us_about_you".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.displayMedium)),
                                SizedBox(height: 65.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 12.h),
                                    child: Text("lbl_name".tr,
                                        style: CustomTextStyles
                                            .titleSmallGray70001)),
                                SizedBox(height: 12.v),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.h),
                                    child: BlocSelector<SignUpBloc, SignUpState,
                                            TextEditingController?>(
                                        selector: (state) =>
                                            state.nameController,
                                        builder: (context, nameController) {
                                          return CustomTextFormField(
                                              controller: nameController,
                                              hintText: "lbl_ex_nourah".tr,
                                              alignment: Alignment.center);
                                        })),
                                SizedBox(height: 28.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 12.h),
                                    child: Text("lbl_age".tr,
                                        style: CustomTextStyles
                                            .titleSmallGray70001)),
                                SizedBox(height: 10.v),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.h),
                                    child: InkWell(
                                      onTap: () async {
                                        final selectedAgeDate =
                                            await showDatePicker(
                                                context: context,
                                                firstDate: DateTime(1920),
                                                lastDate: DateTime.now(),
                                                currentDate: ageDate ?? DateTime(2000),
                                                initialEntryMode:
                                                    DatePickerEntryMode
                                                        .calendarOnly);
                                        if (selectedAgeDate == null) return;
                                        ageDate = selectedAgeDate;
                                        setState(() {});
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 12),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6.h),
                                          border: Border.all(
                                            color: appTheme.gray500,
                                            width: 1,
                                          ),
                                        ),
                                        child: Text(
                                          ageDate != null
                                              ? ('${ageDate!.day}- ${ageDate!.month}- ${ageDate!.year}')
                                                  .toString()
                                              : "lbl_dd_mm_yyyy".tr,
                                          style: TextStyle(
                                              color: ageDate != null
                                                  ? null
                                                  : Colors.grey),
                                        ),
                                      ),
                                    )),
                                // return CustomTextFormField(
                                //     controller:
                                //         frameSeventeenController,
                                //     hintText: "lbl_dd_mm_yyyy".tr,
                                //     textInputAction:
                                //         TextInputAction.done,
                                //     alignment: Alignment.center,
                                //     onTa
                                //   );),
                                SizedBox(height: 20.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 12.h),
                                    child: Text("lbl_gender".tr,
                                        style: CustomTextStyles
                                            .titleSmallGray70001)),
                                SizedBox(height: 24.v),
                                _buildTen(context),
                                SizedBox(height: 33.v),
                                BlocBuilder<SignUpBloc, SignUpState>(
                                    builder: (context, state) {
                                  return CustomElevatedButton(
                                    text: "lbl_continue".tr,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12.h),
                                    alignment: Alignment.center,
                                    onPressed: () async {
                                      if ((state.nameController?.text.isEmpty ??
                                              true) ||
                                          ageDate == null) return;
                                      await loading();
                                      onTapTxtSkip(context);
                                    },
                                  );
                                }),
                                SizedBox(height: 15.v),
                                Align(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                        onTap: () {
                                          onTapTxtSkip(context);
                                        },
                                        child: Text("lbl_skip".tr,
                                            style: CustomTextStyles
                                                .bodyLargeBluegray800))),
                                SizedBox(height: 16.v)
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

  /// Section Widget
  Widget _buildTen(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 12.h, right: 27.h),
        child: Row(children: [
          Expanded(
            child: InkWell(
              onTap: () {
                gender = Gender.female;
                setState(() {});
              },
              child: Container(
                // imagePath: ImageConstant.imgFrame1000001766,
                child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                                        'assets/images/male.png',
                          color: gender == Gender.female
                              ? Colors.white
                              : Colors.grey),
                    )),
                height: 131.v,
                // width: 149.h,
                // margin: EdgeInsets.only(left: 15.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.h),
                    color: gender == Gender.female ? theme.primaryColor : null,
                    border: Border.all(color: Color(0xFFE0E0E0))),
              ),
            ),
          ),
          // CustomImageView(
          //     imagePath: ImageConstant.imgFrame1000001765,
          //     height: 131.v,
          //     width: 149.h,
          //     boxColor: gender == Gender.female ? theme.primaryColor : null,
          //     onTap: () {
          //       gender = Gender.female;
          //       setState(() {});
          //     },
          //     radius: BorderRadius.circular(12.h)),

          SizedBox(
            width: 15.h,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                gender = Gender.male;
                setState(() {});
              },
              child: Container(
                // imagePath: ImageConstant.imgFrame1000001766,
                child: FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                                        'assets/images/female.png',
                                        color: gender == Gender.male
                              ? Colors.white
                              : Colors.grey
                                      ),
                    )),
                height: 131.v,
                // width: 149.h,
                // margin: EdgeInsets.only(left: 15.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.h),
                    color: gender == Gender.male ? theme.primaryColor : null,
                    border: Border.all(color: Color(0xFFE0E0E0))),
              ),
            ),
          )
        ]));
  }

  /// Navigates to the iphone1314TwentysixScreen when the action is triggered.
  onTapTxtSkip(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.iphone1314TwentysixScreen,// go to Home Page
    );
  }
}
