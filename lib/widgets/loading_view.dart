import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:task/core/app_export.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: appTheme.gray400,
      highlightColor: appTheme.gray500,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 20.v),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 45.h,
              decoration: BoxDecoration(
                color: appTheme.gray400,
                borderRadius: BorderRadius.circular(11.h),
              ),
            ),
            SizedBox(height: 71.v),
            Container(
              height: 132.v,
              width: 147.h,
              decoration: BoxDecoration(
                color: appTheme.gray400,
              ),
            ),
            SizedBox(height: 31.v),
            CustomImageView(
              imagePath: ImageConstant.imgGroupGray400,
              height: 7.v,
              width: 133.h,
            ),
            Text(
              '25',
              style: CustomTextStyles.poppinsGray400,
            ),
            Container(
              height: 59.v,
              width: 327.h,
              decoration: BoxDecoration(
                color: appTheme.gray400,
                borderRadius: BorderRadius.circular(11.h),
              ),
            ),
            SizedBox(height: 31.v),
            Container(
              height: 240.v,
              width: 327.h,
              decoration: BoxDecoration(
                color: appTheme.gray5001,
                borderRadius: BorderRadius.circular(11.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
