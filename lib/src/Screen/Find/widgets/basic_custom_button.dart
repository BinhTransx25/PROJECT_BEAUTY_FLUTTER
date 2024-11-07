import 'package:flutter/material.dart';

enum BasicCustomButtonType { primary, secondary, outline }

enum BasicCustomButtonSize { small, medium, large }

class BasicCustomButton extends StatelessWidget {
  final String title;
  final BasicCustomButtonType? type;
  final BasicCustomButtonSize? size;
  final VoidCallback? onPressed;


  const BasicCustomButton(
      {super.key, required this.title, this.type, this.size, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final BasicCustomButtonType buttonType =
        type ?? BasicCustomButtonType.primary;

    final backgroundColor = buttonType == BasicCustomButtonType.primary
        ? Color(0xffD61355)
        : (buttonType == BasicCustomButtonType.outline
            ? Colors.transparent
            : Color(0xffF4F4F4));

    final titleColor = buttonType == BasicCustomButtonType.primary
        ? Color(0xffFFFFFF)
        : (buttonType == BasicCustomButtonType.outline
            ? Color(0xffD61355)
            : Color(0xff000000));

    final borderColor = buttonType == BasicCustomButtonType.outline
        ? Color(0xffD61355)
        : Colors.transparent;

    final buttonSize = size ?? BasicCustomButtonSize.medium;
    double buttonWidth = 0;

    switch (buttonSize) {
      case BasicCustomButtonSize.small:
        buttonWidth = 105.0;
        break;
      case BasicCustomButtonSize.medium:
        buttonWidth = 160.0;
        break;
      case BasicCustomButtonSize.large:
        buttonWidth = 335.0;
        break;
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: borderColor,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: buttonType == BasicCustomButtonType.primary
                ? Colors.black.withOpacity(0.1)
                : Color(0x00000000),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          minimumSize: Size(buttonWidth, 41.0),
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 15.0, color: titleColor),
        ),
      ),
    );
  }
}
