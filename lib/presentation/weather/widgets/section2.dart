import 'package:flutter/material.dart';
import 'package:task/core/app_export.dart';
import 'package:task/presentation/weather/models/weather_model.dart';

class Section2 extends StatelessWidget {
  final Daily data;

  const Section2(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 17.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.fillGray5001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder11,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 3.h),
            child: Text(
              "SUNRISE & SUNSET",
              style: theme.textTheme.labelLarge,
            ),
          ),
          SizedBox(height: 31.v),
          SizedBox(
            height: 100.v,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 31.h),
                    child: Text(
                      "Sunrise",
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 23.h,
                      top: 16.v,
                    ),
                    child: Text(
                      data.sunrise.formatTime(),
                      style: CustomTextStyles.bodySmallGray50012,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 35.h),
                        child: Text(
                          "Sunset",
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      SizedBox(height: 1.v),
                      Container(
                        height: 59.v,
                        width: 240.h,
                        margin: EdgeInsets.only(right: 1.h),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: SizedBox(
                                height: 50.v,
                                width: 188.h,
                                child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.imgVectorLightBlue200,
                                      height: 50.v,
                                      width: 188.h,
                                      alignment: Alignment.center,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 1.h),
                                        child: SizedBox(
                                          height: 42.v,
                                          child: VerticalDivider(
                                            width: 1.h,
                                            thickness: 1.v,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 50.h),
                                child: SizedBox(
                                  height: 42.v,
                                  child: VerticalDivider(
                                    width: 1.h,
                                    thickness: 1.v,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 25.h),
                                child: Text(
                                  data.sunset.formatTime(),
                                  style: CustomTextStyles.bodySmallGray50012,
                                ),
                              ),
                            ),

                            CustomImageView(
                              imagePath: ImageConstant.imgGroup,
                              height: 17.adaptSize,
                              width: 17.adaptSize,
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(
                                left: 61.h,
                                top: 4.v,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
