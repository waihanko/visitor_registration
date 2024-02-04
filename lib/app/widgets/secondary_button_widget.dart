import 'package:flutter/material.dart';

import '../constant/resources/app_colors.dart';

class PrimaryButtonWidget extends StatefulWidget {
  final Function? onPressed;
  final Color bgColor;
  final Color borderColor;
  final Widget? child;
  final double height;
  final double radiusFactor;
  final double? width;

  const PrimaryButtonWidget({
    required this.onPressed,
    this.bgColor = AppColors.buttonColor,
    this.borderColor = Colors.transparent,
    this.child,
    this.height = 52,
    this.radiusFactor =  0.2,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  _PrimaryButtonWidgetState createState() => _PrimaryButtonWidgetState();
}

class _PrimaryButtonWidgetState extends State<PrimaryButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: widget.width,
      height: widget.height,
      onPressed: ()=> widget.onPressed?.call(),
      child: widget.child ?? const SizedBox(),
      color: widget.bgColor,
      highlightElevation: 0,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.height! * widget.radiusFactor),
      ),
    );
  }
}
