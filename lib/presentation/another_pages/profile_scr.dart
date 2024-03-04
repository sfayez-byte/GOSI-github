import 'package:flutter/material.dart';
import 'package:sanad5pages/core/app_export.dart';
import 'package:sanad5pages/main.dart';
import 'package:sanad5pages/widgets/custom_elevated_button.dart';
import 'package:sanad5pages/widgets/custom_icon_button.dart';

class ProfileScr extends StatelessWidget {
  static Widget builder(BuildContext context) => ProfileScr();
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
                                // Spacer(flex: 29),
                                Row(children: [
                                  BackButton(),
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/profile-pic.png'),
                                    radius: 20,
                                  ),
                                  Column(
                                    children: [
                                      Text('Hey, Norah',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text('Welcome bace',
                                          style: TextStyle(
                                              color: Colors.grey[300],
                                              fontSize: 12)),
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Icon(Icons.settings),
                                ]),
                                Expanded(
                                  child: Center(
                                    child: CustomImageView(
                                        imagePath:
                                            'assets/images/profile-body.png',
                                        alignment: Alignment.center),
                                  ),
                                ),
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
