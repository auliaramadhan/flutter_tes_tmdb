import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_private/helper/global.dart';

import '../theme/appfont.dart';

class Utils {
  Utils._();

  static void showError({
    required String? text,
  }) {
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      // duration: const Duration(seconds: 1),
      content: Text(
        text ?? '',
        style: AppFont.body.copyWith(color: Colors.white),
        // overflow: TextOverflow.ellipsis,
        maxLines: kDebugMode ? null : 3,
      ),
    );

    scaffoldMessengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static FormFieldValidator<String>? formValidator(String? warning, [FormFieldValidator<String>? nextValidator]) {
    return (value) {
      if (value!.isEmpty) {
        return warning;
      }
      if (nextValidator != null) {
        return nextValidator(value);
      }
      return null;
    };
  }

  static void showSuccess({
    required String? text,
  }) {
    final snackBar = SnackBar(
      backgroundColor: Colors.green,
      // duration: const Duration(seconds: 1),
      content: Text(
        text ?? '',
        style: AppFont.body.copyWith(color: Colors.white),
        // overflow: TextOverflow.ellipsis,
        maxLines: kDebugMode ? null : 3,
      ),
    );

    scaffoldMessengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void showAlert({
    required String? text,
  }) {
    final snackBar = SnackBar(
      backgroundColor: Colors.black54,
      // duration: const Duration(seconds: 1),
      content: Text(text ?? '', style: AppFont.body.copyWith(color: Colors.white)),
    );

    scaffoldMessengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static Uint8List convertBase64Image(String base64String) {
    return const Base64Decoder().convert(base64String.split(',').last);
  }

  // static Future<String?> getDeviceId() async {
  //   return await PlatformDeviceId.getDeviceId;
  //   final device = DeviceInfoPlugin();
  //   bool isIOS = defaultTargetPlatform == TargetPlatform.iOS;

  //   if (isIOS) {
  //     // import 'dart:io'
  //     var iosDeviceInfo = await device.iosInfo;
  //     return '${iosDeviceInfo.identifierForVendor}${iosDeviceInfo.model}'; // unique ID on iOS
  //   } else {
  //     var androidDeviceInfo = await device.androidInfo;
  //     return '${androidDeviceInfo.brand}${androidDeviceInfo.model}'; // unique ID on Android
  //   }
  // }

  static void log(String msg) {
    if (kDebugMode) {
      print(msg);
    }
  }

  // static showDialogShare(BuildContext context, String msg) {
  //   SocialShare.shareOptions(msg);
  // }
}

// SizedBox\(\n\s*width:(.*),\n\s*\)
