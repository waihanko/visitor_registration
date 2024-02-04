import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/resources/app_colors.dart';
import '../constant/resources/app_dimens.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.width = double.infinity,
    this.onChanged,
    this.onSubmitted,
    this.hint,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.isEnabled = true,
    this.maxLine = 1,
    this.textInputFormatter,
    this.suffixIcon,
    this.textColor = AppColors.primaryColor,
    this.radiusFactor = 0.18,
    this.verticalContentPadding = AppDimens.marginCardMedium2,
    this.fillColor = AppColors.backgroundColor1,
    this.onValidate,
  }) : super(key: key);

  final double width;
  final int maxLine;
  final Function(String)? onChanged;
  final Function? onSubmitted;
  final String? hint;
  final bool isEnabled;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final List<TextInputFormatter>? textInputFormatter;
  final Widget? suffixIcon;
  final double radiusFactor;
  final Color fillColor;
  final Color textColor;
  final double verticalContentPadding;
  final Function(String? value)? onValidate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: !isEnabled,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      maxLines: maxLine,
      cursorColor: AppColors.primaryColor,
      onFieldSubmitted: (_) => onSubmitted!(),
      validator: (value) => onValidate?.call(value),
      inputFormatters: textInputFormatter ?? [],
      onChanged: (value) {
        if (onChanged != null) onChanged!(value);
      },
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          fillColor: fillColor,
          filled: true,
          isDense: true,
          contentPadding: const EdgeInsets.only(
              bottom: AppDimens.marginCardMedium2,
              top: AppDimens.marginCardMedium2),
          hintText: hint,
          prefix: const Padding(
              padding: EdgeInsets.only(left: AppDimens.marginCardMedium)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(52 * radiusFactor),
            ),
            borderSide:
                const BorderSide(color: AppColors.outlineColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(52 * radiusFactor),
            ),
            borderSide: const BorderSide(
                color: AppColors.textFieldBorderColor, width: 1.5),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(52 * radiusFactor),
            ),
            borderSide: const BorderSide(
              color: AppColors.outlineColor,
              width: 0.2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(52 * radiusFactor),
            ),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(52 * radiusFactor),
            ),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          )),
    );
  }
}
