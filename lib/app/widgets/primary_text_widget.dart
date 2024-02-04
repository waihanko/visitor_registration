import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/resources/app_colors.dart';
import '../constant/resources/app_dimens.dart';

class PrimaryTextWidget extends StatelessWidget {
  final String? text;
  final double? textSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final int? maxLine;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;
  final double? lineHeight;

  const PrimaryTextWidget(
    this.text, {
    Key? key,
    this.textSize = AppDimens.textRegular,
    this.fontWeight = FontWeight.w500,
    this.textColor = AppColors.blackColor,
    this.textAlign = TextAlign.start,
    this.letterSpacing = 0.0,
    this.textOverflow = TextOverflow.ellipsis,
    this.textDecoration = TextDecoration.none,
    this.maxLine = 5,
    this.lineHeight = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "-",
      textAlign: textAlign,
      style: TextStyle(
          fontSize: textSize,
          color: textColor,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          decoration: textDecoration,
          height: lineHeight,
          decorationColor: AppColors.whiteColor,
          decorationThickness: 5),
      maxLines: maxLine,
      overflow: textOverflow,
    );
  }
}
