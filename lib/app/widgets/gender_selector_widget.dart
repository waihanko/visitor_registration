import 'package:flutter/material.dart';
import 'package:visitor_registration/app/constant/resources/app_dimens.dart';
import 'package:visitor_registration/app/widgets/primary_text_widget.dart';

import '../constant/app_constants.dart';
import '../constant/resources/app_colors.dart';

class GenderDropdownWidget extends StatefulWidget {
  const GenderDropdownWidget({required this.currentGender ,required this.onGenderChanged, super.key});

  final Function(int?) onGenderChanged;
  final int currentGender;
  @override
  _GenderDropdownWidgetState createState() => _GenderDropdownWidgetState();
}

class _GenderDropdownWidgetState extends State<GenderDropdownWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PrimaryTextWidget('Select your gender:'),
        const SizedBox(
          height: AppDimens.marginMedium,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimens.marginSmall,
            horizontal: AppDimens.marginCardMedium,
          ),
          decoration: BoxDecoration(
              color: AppColors.backgroundColor1,
              borderRadius: BorderRadius.circular(AppDimens.marginMedium),
              border: Border.all(width: 1.5, color: AppColors.outlineColor)),
          child: DropdownButton(
            isExpanded: true,
            underline: const SizedBox(),
            value: widget.currentGender,
            onChanged: (int? newValue)  {
              widget.onGenderChanged.call(newValue);
            },
            items: gender.entries.map((MapEntry<int, String> entry) {
              return DropdownMenuItem(
                value: entry.key,
                child: Text(entry.value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
