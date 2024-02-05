import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:visitor_registration/app/constant/resources/app_colors.dart';
import 'package:visitor_registration/app/constant/resources/app_dimens.dart';
import 'package:visitor_registration/app/constant/resources/app_strings.dart';
import 'package:visitor_registration/app/data_source/local/dao/visitor_data_dao.dart';
import 'package:visitor_registration/app/data_source/local/vo/visitor_data_vo.dart';
import 'package:visitor_registration/app/features/admin/admin_screen.dart';
import 'package:visitor_registration/app/helper/validation_helper.dart';
import 'package:visitor_registration/app/widgets/responsive.dart';
import 'package:visitor_registration/app/widgets/secondary_button_widget.dart';

import '../../widgets/gender_selector_widget.dart';
import '../../widgets/primary_text_widget.dart';
import '../../widgets/registration_input_form_widget.dart';
import '../../widgets/registration_radio_form_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isInCurrentQuarantine = false;
  bool isContactWithCovid19Person = false;
  bool isCurrentSufferFlu = false;
  bool isAcceptTermAndCondition = false;
  int gender = 1;

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController businessEmailEditingController =
      TextEditingController();
  TextEditingController companyNameEditingController = TextEditingController();
  TextEditingController designationEditingController = TextEditingController();
  TextEditingController businessNumberEditingController =
      TextEditingController();
  TextEditingController nrcEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: false,
        title: const PrimaryTextWidget(
          AppString.registrationFormTitle,
          textSize: AppDimens.textRegular3X,
          fontWeight: FontWeight.w500,
          textColor: AppColors.whiteColor,
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AdminScreen(),
                  )),
              icon: const Icon(
                Icons.list,
                color: Colors.white,
              ))
        ],
      ),
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? Padding(
              padding: const EdgeInsets.all(AppDimens.marginCardMedium2),
              child: PrimaryButtonWidget(
                onPressed: () => _onRegister(),
                child: const PrimaryTextWidget(
                  "Submit",
                  textColor: AppColors.whiteColor,
                  textSize: AppDimens.textRegular2X,
                ),
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.marginXLarge),
            child: Responsive(
              mobile: _getMobileView(),
              desktop: _getDesktopView(),
              tablet: _getTabletView(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getMobileView(){
    return Column(
      children: [
        RegistrationInputFormWidget(
            title: "* Name",
            inputEditingController: nameEditingController,
            textInputAction: TextInputAction.next,
            onValidate: (value) =>
                ValidationHelper.nameValidation(value)),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        RegistrationInputFormWidget(
          title: "* Business Email",
          inputEditingController: businessEmailEditingController,
          textInputAction: TextInputAction.next,
          onValidate: (value) =>
              ValidationHelper.emailValidation(value),
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        RegistrationInputFormWidget(
          title: "* Business number",
          inputEditingController: businessNumberEditingController,
          textInputAction: TextInputAction.next,
          onValidate: (value) =>
              ValidationHelper.nameValidation(value),
          textInputType: TextInputType.number,
          textInputFormatter: [
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        RegistrationInputFormWidget(
          title: "* NRC/ FIN Number (Last 4 characters)",
          inputEditingController: nrcEditingController,
          textInputAction: TextInputAction.done,
          onValidate: (value) =>
              ValidationHelper.nrcValidation(value),
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        RegistrationInputFormWidget(
          title: "Licence Plate",
          inputEditingController: companyNameEditingController,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        RegistrationInputFormWidget(
          title: "Designation",
          textInputAction: TextInputAction.next,
          inputEditingController: designationEditingController,
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        Container(
          padding:
          const EdgeInsets.only(left: AppDimens.marginCardMedium),
          decoration: const BoxDecoration(
              border: Border(
                  left: BorderSide(
                    color: AppColors.primaryColor,
                    width: 3.0,
                  ))),
          child: GenderDropdownWidget(
              currentGender: gender,
              onGenderChanged: (value) {
                setState(() {
                  gender = value ?? 0;
                });
              }),
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        RegistrationRadioFormWidget(
          title:
          "Are you currently under a Quarantine Order, Stay-Home Notice?",
          selectedValue: isInCurrentQuarantine,
          onChange: (value) {
            setState(() {
              isInCurrentQuarantine = value;
            });
          },
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        RegistrationRadioFormWidget(
          title:
          "Have you had close contact with a confirmed Covid-19 person in the past 14 Days?",
          selectedValue: isContactWithCovid19Person,
          onChange: (value) {
            setState(() {
              isContactWithCovid19Person = value;
            });
          },
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        RegistrationRadioFormWidget(
          title: "Do you have any fever or flu-like symptoms?",
          selectedValue: isCurrentSufferFlu,
          onChange: (value) {
            setState(() {
              isCurrentSufferFlu = value;
            });
          },
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24.0,
              width: 24.0,
              child: Checkbox(
                activeColor: AppColors.buttonColor,
                value: isAcceptTermAndCondition,
                onChanged: (value) => {
                  setState(() {
                    isAcceptTermAndCondition = value ?? false;
                  })
                },
              ),
            ),
            const SizedBox(
              width: AppDimens.marginMedium,
            ),
            const Expanded(
                child: PrimaryTextWidget(
                  "By completing this online form, I acknowledge and contest to the collection, use, and disclosure of my personal data for security verification, access control and safety purpose",
                ))
          ],
        )
      ],
    );
  }

  Widget _getDesktopView() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: RegistrationInputFormWidget(
                  title: "* Name",
                  inputEditingController: nameEditingController,
                  textInputAction: TextInputAction.next,
                  onValidate: (value) =>
                      ValidationHelper.nameValidation(value)),
            ),
            const SizedBox(
              width: AppDimens.marginCardMedium2,
            ),
            Expanded(
              child: RegistrationInputFormWidget(
                title: "* Business Email",
                inputEditingController:
                businessEmailEditingController,
                textInputAction: TextInputAction.next,
                onValidate: (value) =>
                    ValidationHelper.emailValidation(value),
              ),
            )
          ],
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: RegistrationInputFormWidget(
                title: "Designation",
                textInputAction: TextInputAction.done,
                inputEditingController: designationEditingController,
              ),
            ),
            const SizedBox(
              width: AppDimens.marginCardMedium2,
            ),
            Expanded(
              child: RegistrationInputFormWidget(
                title: "* Business number",
                inputEditingController:
                businessNumberEditingController,
                textInputAction: TextInputAction.next,
                onValidate: (value) =>
                    ValidationHelper.nameValidation(value),
                textInputType: TextInputType.number,
                textInputFormatter: [
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: RegistrationInputFormWidget(
                title: "Company Name",
                inputEditingController: companyNameEditingController,
                textInputAction: TextInputAction.next,
              ),
            ),
            const SizedBox(
              width: AppDimens.marginCardMedium2,
            ),
            Expanded(
              child: RegistrationInputFormWidget(
                title: "* NRC/ FIN Number (Last 4 characters)",
                inputEditingController: nrcEditingController,
                textInputAction: TextInputAction.done,
                onValidate: (value) =>
                    ValidationHelper.nrcValidation(value),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                    left: AppDimens.marginCardMedium),
                margin: EdgeInsets.only(
                    right: AppDimens.marginCardMedium),
                decoration: const BoxDecoration(
                    border: Border(
                        left: BorderSide(
                          color: AppColors.primaryColor,
                          width: 3.0,
                        ))),
                child: GenderDropdownWidget(
                    currentGender: gender,
                    onGenderChanged: (value) {
                      setState(() {
                        gender = value ?? 1;
                      });
                    }),
              ),
            ),
            const Expanded(child: SizedBox())
          ],
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        RegistrationRadioFormWidget(
          title:
          "Are you currently under a Quarantine Order, Stay-Home Notice?",
          selectedValue: isInCurrentQuarantine,
          onChange: (value) {
            setState(() {
              isInCurrentQuarantine = value;
            });
          },
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        RegistrationRadioFormWidget(
          title:
          "Have you had close contact with a confirmed Covid-19 person in the past 14 Days?",
          selectedValue: isContactWithCovid19Person,
          onChange: (value) {
            setState(() {
              isContactWithCovid19Person = value;
            });
          },
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        RegistrationRadioFormWidget(
          title: "Do you have any fever or flu-like symptoms?",
          selectedValue: isCurrentSufferFlu,
          onChange: (value) {
            setState(() {
              isCurrentSufferFlu = value;
            });
          },
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24.0,
              width: 24.0,
              child: Checkbox(
                activeColor: AppColors.buttonColor,
                value: isAcceptTermAndCondition,
                onChanged: (value) => {
                  setState(() {
                    isAcceptTermAndCondition = value ?? false;
                  })
                },
              ),
            ),
            const SizedBox(
              width: AppDimens.marginMedium,
            ),
            const Expanded(
                child: PrimaryTextWidget(
                  "By completing this online form, I acknowledge and contest to the collection, use, and disclosure of my personal data for security verification, access control and safety purpose",
                ))
          ],
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        PrimaryButtonWidget(
          width: Responsive.isMobile(context)
              ? double.infinity
              : MediaQuery.of(context).size.width * 0.3,
          onPressed: () => _onRegister(),
          child: const PrimaryTextWidget(
            "Submit",
            textColor: AppColors.whiteColor,
            textSize: AppDimens.textRegular2X,
          ),
        ),
      ],
    );
  }

  Widget _getTabletView() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: RegistrationInputFormWidget(
                  title: "* Name",
                  inputEditingController: nameEditingController,
                  textInputAction: TextInputAction.next,
                  onValidate: (value) =>
                      ValidationHelper.nameValidation(value)),
            ),
            const SizedBox(
              width: AppDimens.marginCardMedium2,
            ),
            Expanded(
              child: RegistrationInputFormWidget(
                title: "* Business Email",
                inputEditingController:
                businessEmailEditingController,
                textInputAction: TextInputAction.next,
                onValidate: (value) =>
                    ValidationHelper.emailValidation(value),
              ),
            )
          ],
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: RegistrationInputFormWidget(
                title: "Designation",
                textInputAction: TextInputAction.next,
                inputEditingController: designationEditingController,
              ),
            ),
            const SizedBox(
              width: AppDimens.marginCardMedium2,
            ),
            Expanded(
              child: RegistrationInputFormWidget(
                title: "* Business number",
                inputEditingController:
                businessNumberEditingController,
                textInputAction: TextInputAction.next,
                onValidate: (value) =>
                    ValidationHelper.nameValidation(value),
                textInputType: TextInputType.number,
                textInputFormatter: [
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: RegistrationInputFormWidget(
                title: "Company Name",
                inputEditingController: companyNameEditingController,
                textInputAction: TextInputAction.next,
              ),
            ),
            const SizedBox(
              width: AppDimens.marginCardMedium2,
            ),
            Expanded(
              child: RegistrationInputFormWidget(
                title: "* NRC/ FIN Number (Last 4 characters)",
                inputEditingController: nrcEditingController,
                textInputAction: TextInputAction.done,
                onValidate: (value) =>
                    ValidationHelper.nrcValidation(value),
              ),
            )
          ],
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                    left: AppDimens.marginCardMedium),
                margin: EdgeInsets.only(
                    right: AppDimens.marginCardMedium),
                decoration: const BoxDecoration(
                    border: Border(
                        left: BorderSide(
                          color: AppColors.primaryColor,
                          width: 3.0,
                        ))),
                child: GenderDropdownWidget(
                    currentGender: gender,
                    onGenderChanged: (value) {
                      setState(() {
                        gender = value ?? 1;
                      });
                    }),
              ),
            ),
            const Expanded(child: SizedBox())
          ],
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        RegistrationRadioFormWidget(
          title:
          "Are you currently under a Quarantine Order, Stay-Home Notice?",
          selectedValue: isInCurrentQuarantine,
          onChange: (value) {
            setState(() {
              isInCurrentQuarantine = value;
            });
          },
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        RegistrationRadioFormWidget(
          title:
          "Have you had close contact with a confirmed Covid-19 person in the past 14 Days?",
          selectedValue: isContactWithCovid19Person,
          onChange: (value) {
            setState(() {
              isContactWithCovid19Person = value;
            });
          },
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        RegistrationRadioFormWidget(
          title: "Do you have any fever or flu-like symptoms?",
          selectedValue: isCurrentSufferFlu,
          onChange: (value) {
            setState(() {
              isCurrentSufferFlu = value;
            });
          },
        ),
        const SizedBox(
          height: AppDimens.marginLarge,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24.0,
              width: 24.0,
              child: Checkbox(
                activeColor: AppColors.buttonColor,
                value: isAcceptTermAndCondition,
                onChanged: (value) => {
                  setState(() {
                    isAcceptTermAndCondition = value ?? false;
                  })
                },
              ),
            ),
            const SizedBox(
              width: AppDimens.marginMedium,
            ),
            const Expanded(
                child: PrimaryTextWidget(
                  "By completing this online form, I acknowledge and contest to the collection, use, and disclosure of my personal data for security verification, access control and safety purpose",
                ))
          ],
        )
      ],
    );
  }

  void _onRegister() {
    bool isValid = _formKey.currentState!.validate();

    if (!isValid) {
      Fluttertoast.showToast(msg: "Your form is invalid!");
      return;
    } else if (!isAcceptTermAndCondition) {
      Fluttertoast.showToast(
          msg: "Please accept terms and condition to continue!");
    } else {
      VisitorDataVo visitorDataVo = VisitorDataVo(
          name: nameEditingController.text,
          businessEmail: businessEmailEditingController.text,
          businessNumber: businessNumberEditingController.text,
          companyName: companyNameEditingController.text,
          nrc: nrcEditingController.text,
          designation: designationEditingController.text,
          isContactWithCovidPerson: isContactWithCovid19Person,
          isOnQuarantine: isInCurrentQuarantine,
          isSufferFlu: isCurrentSufferFlu,
          gender: gender);
      VisitorDataDao().addVisitorData(visitorDataVo: visitorDataVo);
      Fluttertoast.showToast(msg: "Success Registered!");
      _formKey.currentState!.reset();
      nameEditingController.clear();
      businessEmailEditingController.clear();
      businessNumberEditingController.clear();
      companyNameEditingController.clear();
      nrcEditingController.clear();
      designationEditingController.clear();
      setState(() {
        isContactWithCovid19Person = false;
        isInCurrentQuarantine = false;
        isCurrentSufferFlu = false;
        isAcceptTermAndCondition = false;
        gender = 1;
      });
    }
  }


}
