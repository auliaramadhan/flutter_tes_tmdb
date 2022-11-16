import 'package:flutter/material.dart';
import 'package:flutter_starter_private/components/button/button_primary.dart';
import 'package:flutter_starter_private/components/button/button_secondary.dart';
import 'package:flutter_starter_private/components/spacing.dart';
import '../../theme/appfont.dart';
import '../../theme/apptheme.dart';

class ModalConfirm extends StatelessWidget {
  final VoidCallback onConfirm;
  final String title;
  final String description;
  final String onConfirmText;
  final String onRejectText;
  final Widget? image;
  final VoidCallback? onReject;
  const ModalConfirm({
    Key? key,
    required this.onConfirm,
    required this.description,
    this.title = 'Konfirmasi',
    this.onReject,
    this.onConfirmText = 'Ya, yakin',
    this.onRejectText = 'Tidak',
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: AppTheme.shapeRound16,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ExtraHeight(8),
            if (image != null) SizedBox(height: 200, child: image!),
            if (image != null) const ExtraHeight(8),
            Text(title, style: AppFont.title18, textAlign: TextAlign.center),
            const ExtraHeight(8),
            Text(description, style: AppFont.subtitle, textAlign: TextAlign.center),
            const ExtraHeight(),
            ButtonSecondary(
              // child: Text(onRejectText, style: AppFont.bodyBold),
              text: onRejectText,
              onPressed: () {
                Navigator.pop(context);
                onReject?.call();
              },
            ),
            const ExtraHeight(8),
            ButtonPrimary(
              // height: 36,
              text: onConfirmText,
              onPressed: () {
                Navigator.pop(context);
                onConfirm();
              },
            ),
            const ExtraHeight(8),
          ],
        ),
      ),
    );
  }
}
