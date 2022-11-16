import 'package:flutter/material.dart';
import '../theme/app_color.dart';
import '../theme/appfont.dart';

class AppTheme {
  AppTheme._();

  static const primary = Color(0xffE42313);
  static const grey = Color(0xff344253);
  static const grey50 = Color(0xff5e6a79);
  static const grey20 = Color(0xffc8cbd1);
  static const white = Color(0xffffffff);
  static const black = Color(0xff000000);
  static const background = Color(0xfff3f5f9);
  static const bordercolor = Color(0xffebebeb);
  static const redColor = Color(0xffef3e4a);
  static const yellowColor = Color(0xfffaa33e);
  static const blueText = Color(0xff384D9D);
  static const bottomsheet = Color(0xffC4C4C4);

  static const String fontName = 'Nunito';

  static final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
    borderSide: const BorderSide(color: AppColor.divider, width: 1.0),
  );
  static final inputTheme = InputDecoration(
    border: inputBorder,
    focusedBorder: inputBorder,
    enabledBorder: inputBorder,
    isDense: true,
    prefixIconConstraints: BoxConstraints.tight(Size(36, 24)),
  );

  static final borderLineR8 = BoxDecoration(
    border: Border.all(color: AppColor.divider, width: 1),
    borderRadius: BorderRadius.circular(8),
  );
  static BoxDecoration borderLineR8top = BoxDecoration(
    border: Border.all(color: AppColor.divider, width: 1),
    borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
  );
  static BoxDecoration borderLineR8bottom = BoxDecoration(
    border: Border.all(color: AppColor.divider, width: 1),
    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
  );

  static const BoxDecoration iconDarkBg = BoxDecoration(
    color: AppColor.bgIconGrey,
    shape: BoxShape.circle,
  );

  static BoxDecoration cardR8 = BoxDecoration(
    color: AppColor.bgCard,
    borderRadius: BorderRadius.circular(8),
  );

  static final shapeRound8 = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  );
  static final shapeRound4 = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
  );

  static final shapeRound16 = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  );

  static final modalBottomShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  );


  static const shadow = BoxShadow(
    color: AppColor.shadow,
    offset: Offset(0, 3),
    blurRadius: 8,
    spreadRadius: 2,
    blurStyle: BlurStyle.normal,
  );

  static final BoxDecoration shadowCircular8 = BoxDecoration(
    // border: Border.all(color: const Color(0xffe9e9e9), width: 1),
    borderRadius: BorderRadius.circular(8),
    boxShadow: const [shadow],
  );


  static BoxDecoration boxChatPrimary = BoxDecoration(
    color: const Color(0xfdc6e1d3),
    border: Border.all(color: const Color(0xffe9e9e9), width: 1),
    borderRadius: BorderRadius.circular(6),
    boxShadow: const [BoxShadow(color: AppColor.shadow, offset: Offset(0, 3), blurRadius: 8, spreadRadius: 2)],
  );

  static BoxDecoration badgeBlue =
      BoxDecoration(borderRadius: BorderRadius.circular(14), gradient: const LinearGradient(colors: [Color(0xff35b3e3), Color(0xff736efe)], stops: [0, 1]));

  static const ButtonThemeData buttonPrimary =
      ButtonThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))), height: 48, buttonColor: primary, textTheme: ButtonTextTheme.normal);

  static const ButtonThemeData buttonWhite =
      ButtonThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))), height: 48, buttonColor: white, textTheme: ButtonTextTheme.normal);

  static const boxUnderline = BoxDecoration(border: Border(bottom: BorderSide(color: AppColor.divider, width: 1)));

  static final buttonTextPrimary = TextButton.styleFrom(
    minimumSize: Size.zero,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    primary: AppColor.primary,
    textStyle: AppFont.buttonText,
  );

  static final buttonTextPrimaryBig = TextButton.styleFrom(
    minimumSize: const Size(64, 40),
    padding: const EdgeInsets.all(8),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    primary: AppColor.primary,
    textStyle: AppFont.buttonText,
  );
}
