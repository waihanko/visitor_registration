
import 'package:flutter/material.dart';
import 'package:visitor_registration/app/widgets/primary_text_widget.dart';

import '../constant/resources/app_colors.dart';
import '../constant/resources/app_dimens.dart';

class RegistrationRadioFormWidget extends StatefulWidget {
  const RegistrationRadioFormWidget({
    this.onChange,
    this.title = "",
    this.selectedValue = false,
    super.key,
  });

  final String? title;
  final bool? selectedValue;
  final Function(bool)? onChange;

  @override
  State<RegistrationRadioFormWidget> createState() =>
      _RegistrationRadioFormWidgetState();
}

class _RegistrationRadioFormWidgetState
    extends State<RegistrationRadioFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: AppDimens.marginCardMedium),
      decoration: const BoxDecoration(
          border: Border(
              left: BorderSide(
                color: AppColors.primaryColor,
                width: 3.0,
              ))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PrimaryTextWidget(
            widget.title,
          ),
          RadioListTile(
            value: true,
            contentPadding: EdgeInsets.zero,
            groupValue: widget.selectedValue,
            onChanged: (_) => widget.onChange?.call(true),
            title: Text("Yes"),
            activeColor: AppColors.primaryColor,
          ),
          RadioListTile(
            value: false,
            contentPadding: EdgeInsets.zero,
            groupValue: widget.selectedValue,
            onChanged: (_) => widget.onChange?.call(false),
            title: Text("No"),
            activeColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}