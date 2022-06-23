import 'package:design_system/widgets/widgets.dart';
import 'package:flutter/material.dart';

enum SPButtonState { common, disable }
enum SPButtonSize { large, medium, small }

class CustomElevatedButton extends StatelessWidget {
  final String text;

  final VoidCallback onPressed;
  final Icon? icon;
  final Color? buttonColor;
  final bool disableContentPadding;
  final SPButtonState buttonState;
  final SPButtonSize buttonSize;
  final Color textColor;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.buttonState = SPButtonState.common,
    this.buttonColor,
    this.buttonSize = SPButtonSize.large,
    this.disableContentPadding = false,
    this.textColor = SPcolors.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget button = ElevatedButton(
      onPressed: buttonState == SPButtonState.disable ? () {} : onPressed,
      style: ButtonStyle(
        backgroundColor: getbuttonBackGroundColor(buttonState),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: const BorderSide(color: Colors.transparent),
          ),
        ),
      ),
      child: SizedBox(width: double.infinity, child: getSPtext(buttonSize, text)),
    );

    return button;
  }

  MaterialStateProperty<Color> getbuttonBackGroundColor(SPButtonState spButtonState) {
    return MaterialStateProperty.resolveWith<Color>((Set<MaterialState> state) {
      Color backGroudColor = Colors.transparent;
      if (buttonState == SPButtonState.common) backGroudColor = SPcolors.containerColor;

      if (buttonState == SPButtonState.disable) backGroudColor = Colors.grey;

      return backGroudColor;
    });
  }

  Widget getSPtext(SPButtonSize buttonSize, String text) {
    switch (buttonSize) {
      case SPButtonSize.large:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
        );
      case SPButtonSize.medium:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
        );

      case SPButtonSize.small:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
