import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visitor_registration/app/constant/resources/app_dimens.dart';

import 'custom_text_field_widget.dart';
import 'primary_text_widget.dart';

class RegistrationInputFormWidget extends StatelessWidget {
  const RegistrationInputFormWidget({
    required this.title,
    required this.inputEditingController,
    this.onValidate,
    this.textInputFormatter,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    super.key,
  });

  final TextEditingController inputEditingController;
  final String title;
  final Function(String? value)? onValidate;
  final List<TextInputFormatter>? textInputFormatter;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryTextWidget(title),
        const SizedBox(
          height: AppDimens.marginSmall,
        ),
        CustomTextField(
          controller: inputEditingController,
          onValidate: (value)=> onValidate?.call(value),
          textInputFormatter: textInputFormatter,
          textInputAction: textInputAction,
          textInputType: textInputType,
        ),
      ],
    );
  }
}
