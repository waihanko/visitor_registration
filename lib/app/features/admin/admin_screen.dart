import 'package:flutter/material.dart';
import 'package:visitor_registration/app/constant/resources/app_dimens.dart';
import 'package:visitor_registration/app/data_source/local/dao/visitor_data_dao.dart';
import 'package:visitor_registration/app/helper/extension_helper.dart';
import 'package:visitor_registration/app/widgets/primary_text_widget.dart';

import '../../constant/resources/app_colors.dart';
import '../../constant/resources/app_strings.dart';
import '../../data_source/local/vo/visitor_data_vo.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<VisitorDataVo> myHiveData = [];

  @override
  void initState() {
    myHiveData = VisitorDataDao().getVisitorData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData().copyWith(color: Colors.white),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: false,
        title: const PrimaryTextWidget(
          AppString.adminPanelTitle,
          textSize: AppDimens.textRegular3X,
          fontWeight: FontWeight.w500,
          textColor: AppColors.whiteColor,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(AppDimens.marginMedium2),
        itemCount: myHiveData.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(bottom: AppDimens.marginSmall),
          padding: const EdgeInsets.symmetric(
            vertical: AppDimens.marginCardMedium2,
            horizontal: AppDimens.marginMedium2,
          ),
          decoration: BoxDecoration(
              color: AppColors.backgroundColor1,
              borderRadius: BorderRadius.circular(AppDimens.marginMedium)),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.marginSmall),
                color: myHiveData[index].gender.getGender().$2,
                child: PrimaryTextWidget(
                  myHiveData[index].gender.getGender().$1,
                  textSize: AppDimens.textMedium,
                ),
              ),
              const SizedBox(height: AppDimens.marginSmall,),
              PrimaryTextWidget(
                "${myHiveData[index].name} (${myHiveData[index].designation})",
                textSize: AppDimens.textRegular2X,
              ),
              const SizedBox(
                height: AppDimens.marginMedium,
              ),
              PrimaryTextWidget(
                "${myHiveData[index].businessEmail} | ${myHiveData[index].businessNumber}",
                textSize: AppDimens.textMedium,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(
                height: AppDimens.marginMedium,
              ),
              PrimaryTextWidget(
                "${myHiveData[index].nrc} | ${myHiveData[index].companyName}",
                textSize: AppDimens.textMedium,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(
                height: AppDimens.marginMedium,
              ),
              PrimaryTextWidget(
                "1. ${myHiveData[index].isOnQuarantine.isUnderQuarantine().$1}",
                textSize: AppDimens.textMedium,
                fontWeight: FontWeight.w500,
                textColor:
                    myHiveData[index].isOnQuarantine.isUnderQuarantine().$2,
              ),
              const SizedBox(
                height: AppDimens.marginMedium,
              ),
              PrimaryTextWidget(
                "2. ${myHiveData[index].isContactWithCovidPerson.isContactWithCovid19Person().$1}",
                textSize: AppDimens.textMedium,
                fontWeight: FontWeight.w500,
                textColor: myHiveData[index]
                    .isContactWithCovidPerson
                    .isContactWithCovid19Person()
                    .$2,
              ),
              const SizedBox(
                height: AppDimens.marginMedium,
              ),
              PrimaryTextWidget(
                "3. ${myHiveData[index].isSufferFlu.gotFluOrSick().$1}",
                textSize: AppDimens.textMedium,
                fontWeight: FontWeight.w500,
                textColor: myHiveData[index].isSufferFlu.gotFluOrSick().$2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

