import 'package:flutter/material.dart';

import '../../theme/appfont.dart';
import '../../theme/apptheme.dart';
import '../button/button_primary.dart';
import '../spacing.dart';

class ModalAlertImage extends StatelessWidget {
  final VoidCallback? onConfirm;
  final String? title;
  final Widget? image;
  final String description;
  final String onConfirmText;

  const ModalAlertImage({
    Key? key,
    this.onConfirm,
    required this.title,
    required this.description,
    required this.image,
    this.onConfirmText = 'Oke',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: AppTheme.shapeRound16,
      // backgroundColor: ,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ExtraHeight(16),
            if (image != null) SizedBox(height: 200, child: image!),
            if (image != null) const ExtraHeight(16),
            if(title != null) Text(title!, style: AppFont.title16),
            if(title != null) const ExtraHeight(4),
            Text(description, style: AppFont.subtitle),
            const ExtraHeight(16),
            ButtonPrimary(
              text: onConfirmText,
              onPressed: () {
                Navigator.pop(context);
                onConfirm?.call();
              },
            ),
            const ExtraHeight(8),
          ],
        ),
      ),
    );
  }
}
