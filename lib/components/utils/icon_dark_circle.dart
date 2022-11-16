import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/app_color.dart';

class IconDarkCircle extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final double size;
  final Color color;

  const IconDarkCircle({
    Key? key,
    required this.icon,
    this.onPressed,
    this.size = 52,
    this.color = AppColor.bgIconGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      height: size,
      width: size,
      child: IconButton(
        padding: EdgeInsets.zero,
        splashRadius: size - 8 ,
        onPressed: onPressed,
        icon: icon,
        enableFeedback: onPressed != null,
      ),
    );
  }
}
