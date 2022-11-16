import 'package:flutter/material.dart';
import 'package:flutter_starter_private/components/button/button_primary.dart';
import 'package:flutter_starter_private/components/spacing.dart';
import '../../theme/appfont.dart';
import '../../theme/apptheme.dart';

class ModalGeneral extends StatelessWidget {
  final String title;
  final Widget children;
  final VoidCallback? onReject;
  const ModalGeneral({
    Key? key,
    required this.title,
    this.onReject,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: AppTheme.shapeRound16,
      // backgroundColor: ,
      insetPadding:  const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: AppFont.title18),
                SizedBox(
                  height: 24,
                  child: IconButton(
                    iconSize: 24,
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    splashRadius: 24,
                  ),
                ),
              ],
            ),
            const ExtraHeight(8),
            children,
            const ExtraHeight(8),
          ],
        ),
      ),
    );
  }
}
