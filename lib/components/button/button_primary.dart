import 'package:flutter/material.dart';
import '../../theme/app_color.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final double? size;
  final double height;
  final void Function()? onPressed;

  final ButtonStyle? buttonStyle;

  const ButtonPrimary({
    Key? key,
    required this.text,
    required this.onPressed,
    this.size = double.maxFinite,
    this.buttonStyle,
    this.height = 48,
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
            borderRadius: BorderRadius.circular(8),
          ),
          primary: AppColor.primary,
          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Nunito'),
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
        ).merge(buttonStyle),
        child: Text(text),
      ),
    );
  }
}
