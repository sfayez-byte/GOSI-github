import '../models/thirteen_item_model.dart';
import 'package:flutter/material.dart';
import 'package:sanad5pages/core/app_export.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ThirteenItemWidget extends StatelessWidget {
  ThirteenItemWidget(
    this.thirteenItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ThirteenItemModel thirteenItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: InkWell(
        onTap: ()=>
launchUrl(Uri.parse(thirteenItemModelObj.url))
        ,
        child: Container(
          padding: EdgeInsets.all(10.h),
          decoration: AppDecoration.outlineErrorContainer1.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: thirteenItemModelObj?.image,
                height: 86.v,
                width: 154.h,
              ),
              SizedBox(height: 19.v),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Text(
                    thirteenItemModelObj.stretchingExercises!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: theme.textTheme.labelMedium,
                  ),
                ),
              ),
              // SizedBox(height: 33.v),
            ],
          ),
        ),
      ),
    );
  }
}
