import 'package:flutter/material.dart';
import '../theme/app_color.dart';

typedef CloseScreenLoader = bool Function();
typedef ShowScreenLoader = bool Function();

@immutable
class ScreenLoaderController {
  final CloseScreenLoader close;
  final ShowScreenLoader show;

  const ScreenLoaderController({
    required this.close,
    required this.show,
  });
}

class ScreenLoader {
  factory ScreenLoader() => _shared;
  static final ScreenLoader _shared = ScreenLoader._sharedInstance();
  ScreenLoader._sharedInstance();
  ScreenLoaderController? controller;

  void show({
    required BuildContext context,
  }) {
    if (controller?.show() ?? false) {
      return;
    } else {
      controller = showOverlay(
        context: context,
      );
    }
  }

  void hide() {
    controller?.close();
    controller = null;
  }

  ScreenLoaderController showOverlay({
    required BuildContext context,
  }) {
    final state = Overlay.of(context);

    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: AppColor.bgModal,
          child: Transform.scale(
            scale: 3,
            child: const Center(child: CircularProgressIndicator(color: AppColor.divider)),
          ),
        );
      },
    );

    state?.insert(overlay);

    return ScreenLoaderController(
      close: () {
        overlay.remove();
        return true;
      },
      show: () {
        return true;
      },
    );
  }
}
