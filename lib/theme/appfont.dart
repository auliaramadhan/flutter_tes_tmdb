import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../theme/app_color.dart';

class AppFont {
  AppFont._();

  // static const displayLarge = TextStyle( fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  // static const displayMedium = TextStyle( fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  // static const displaySmall = TextStyle( fontSize: 48, fontWeight: FontWeight.w400);
  // static const headlineMedium = TextStyle( fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  // static const headlineSmall = TextStyle( fontSize: 24, fontWeight: FontWeight.w400);
  // static const titleLarge = TextStyle( fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15);
  // static const titleMedium = TextStyle( fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.15);
  // static const titleSmall = TextStyle( fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.1);
  // static const bodyLarge = TextStyle( fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5);
  // static const bodyMedium = TextStyle( fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.25);
  // static const bodySmall = TextStyle( fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25);
  // static const labelLarge = TextStyle( fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 0.4);
  // static const labelMedium = TextStyle( fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 1.5);
  // static const labelSmall = TextStyle( fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5);

  static const headlineMedium = TextStyle( fontSize: 34, fontWeight: FontWeight.w400);
  static const headlineSmall = TextStyle( fontSize: 24, fontWeight: FontWeight.w700);
  static const title22 = TextStyle( fontSize: 22, color: AppColor.primaryText, fontWeight: FontWeight.w700);
  static const title22Secondary2 = TextStyle( fontSize: 22, color: AppColor.secondaryText2, fontWeight: FontWeight.w700);
  static const title18 = TextStyle( fontSize: 18, color: AppColor.primaryText, fontWeight: FontWeight.w700);
  static const title16 = TextStyle( fontSize: 16, color: AppColor.primaryText, fontWeight: FontWeight.w700);
  static const title16Secondary = TextStyle( fontSize: 16, color: AppColor.secondaryText, fontWeight: FontWeight.w600);
  static const title14 = TextStyle( fontSize: 14, color: AppColor.secondaryText2, fontWeight: FontWeight.w700);
  static const subtitleBold = TextStyle( fontSize: 14, color: AppColor.secondaryText, fontWeight: FontWeight.w700);
  static const subtitle = TextStyle( fontSize: 14, color: AppColor.secondaryText, fontWeight: FontWeight.w400);
  static const subtitleSemiB = TextStyle( fontSize: 14, color: AppColor.secondaryText, fontWeight: FontWeight.w600);
  static const subtitle12Bold = TextStyle( fontSize: 12, color: AppColor.secondaryText, fontWeight: FontWeight.w700);
  static const subtitle12SemiB = TextStyle( fontSize: 12, color: AppColor.secondaryText, fontWeight: FontWeight.w600);
  static const subtitle12 = TextStyle( fontSize: 12, color: AppColor.secondaryText, fontWeight: FontWeight.w400);
  static const body = TextStyle( fontSize: 14, color: AppColor.primaryText, fontWeight: FontWeight.w400);
  static const bodyBold = TextStyle( fontSize: 14, color: AppColor.primaryText, fontWeight: FontWeight.w700);
  static const bodySemiBold = TextStyle( fontSize: 14, color: AppColor.primaryText, fontWeight: FontWeight.w600);
  static const body12 = TextStyle( fontSize: 12, color: AppColor.primaryText, fontWeight: FontWeight.w400);
  static const body12Bold = TextStyle( fontSize: 12, color: AppColor.primaryText, fontWeight: FontWeight.w700);
  static const body12SemiB = TextStyle( fontSize: 12, color: AppColor.primaryText, fontWeight: FontWeight.w600);
  static const body16BoldRed = TextStyle( fontSize: 16, color: AppColor.primary, fontWeight: FontWeight.w700);
  // static const bodyBold = TextStyle( fontSize: 12, color: AppColor.primaryText, fontWeight: FontWeight.w700);
  // static const bodySemiBold = TextStyle( fontSize: 12, color: AppColor.primaryText, fontWeight: FontWeight.w600);
  // static const body = TextStyle( fontSize: 12, color: AppColor.primaryText, fontWeight: FontWeight.w400);
  static const caption12 = TextStyle( fontSize: 12, color: AppColor.secondaryText, fontWeight: FontWeight.w400);
  static const caption = TextStyle( fontSize: 10, color: AppColor.secondaryText, fontWeight: FontWeight.w400);
  static const captionBold = TextStyle( fontSize: 10, color: AppColor.secondaryText, fontWeight: FontWeight.w700);

  static const dialogTitle = TextStyle( fontSize: 18, color: AppColor.primaryText, fontWeight: FontWeight.w700);
  static const dialogDesc = TextStyle( fontSize: 16, color: AppColor.secondaryText, fontWeight: FontWeight.w400);
  static const dialogCancel = TextStyle( fontSize: 16, color: AppColor.secondaryText, fontWeight: FontWeight.w700);

  // static form

  static const formlabel = TextStyle( color: AppColor.label, fontSize: 14,fontWeight: FontWeight.w500);
  static const formlabelError = TextStyle( color: AppColor.fontDanger, fontSize: 14,fontWeight: FontWeight.w500);
  static const formlabelSuccess = TextStyle( color: AppColor.fontGreen, fontSize: 14,fontWeight: FontWeight.w500);
  static const formlabel10 = TextStyle( color: AppColor.label, fontSize: 14,fontWeight: FontWeight.w500);

  static const inputLabel = TextStyle( fontSize: 14, color: AppColor.primaryText, fontWeight: FontWeight.w700);
  static const formHint = TextStyle( fontSize: 16, color: AppColor.secondaryText, fontWeight: FontWeight.w400);


  static const black16w700 = TextStyle( color: AppColor.fontBlack, fontSize: 16,fontWeight: FontWeight.w700);
  static const grey12w600 = TextStyle( color: AppColor.fontGrey, fontSize:12, fontWeight: FontWeight.w600);

  // Button
  static const buttonText = TextStyle( color: AppColor.primary, fontSize: 14,fontWeight: FontWeight.w600);
  static const buttonAction = TextStyle( color: Colors.white, fontSize: 18,fontWeight: FontWeight.w600);

  // basic
  static const bold = TextStyle( fontWeight: FontWeight.w700);
  static const semiBold = TextStyle( fontWeight: FontWeight.w600);
  static const underLine = TextStyle( decoration: TextDecoration.underline);

  // color
  static const primary = TextStyle( color: AppColor.primary );
  static const secondary = TextStyle( color: AppColor.secondary );
  static const white = TextStyle( color: Colors.white );

}
