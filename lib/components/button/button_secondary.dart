import 'package:flutter/material.dart';
import '../../theme/app_color.dart';
import '../../theme/appfont.dart';

class ButtonSecondary extends StatelessWidget {
  final String text;
  final double size;
  final double height;
  final Widget? icon;
  final void Function() onPressed;

  final ButtonStyle? buttonStyle;

  const ButtonSecondary({
    Key? key,
    required this.text,
    required this.onPressed,
    this.size = double.infinity,
    this.height = 48,
    this.buttonStyle,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: height,
      child: ElevatedButton(
        // icon: Icon(Icons.abc_outlined) ,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          primary: AppColor.bgLightRed,
        ).merge(buttonStyle),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: AppFont.bodyBold.merge(AppFont.primary)),
            if (icon != null ) icon!,
          ],
        ),
      ),
    );
  }
}
