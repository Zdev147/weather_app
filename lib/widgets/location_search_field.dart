import 'package:flutter/material.dart';
import 'package:task/core/app_export.dart';

class LocationSearchField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onFieldSubmit;

  const LocationSearchField({
    required this.controller,
    required this.onFieldSubmit,
  });

  @override
  Widget build(BuildContext context) => searchViewWidget;

  Widget get searchViewWidget => SizedBox(
        width: double.maxFinite,
        child: TextFormField(
          controller: controller,
          onFieldSubmitted: onFieldSubmit,
          style: theme.textTheme.bodyMedium,
          maxLines: 1,
          decoration: decoration,
        ),
      );

  InputDecoration get decoration => InputDecoration(
        hintText: "Search Location",
        hintStyle: theme.textTheme.bodyMedium,
        suffixIcon: Container(
          margin: EdgeInsets.fromLTRB(30.h, 14.v, 20.h, 14.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgSearch,
            height: 17.adaptSize,
            width: 17.adaptSize,
          ),
        ),
        suffixIconConstraints: BoxConstraints(maxHeight: 46.v),
        isDense: true,
        contentPadding: EdgeInsets.only(left: 11.h, top: 11.v, bottom: 11.v),
        fillColor: appTheme.gray5001,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.h),
          borderSide: BorderSide.none,
        ),
      );
}
