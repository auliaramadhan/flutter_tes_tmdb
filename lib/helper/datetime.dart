import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class DatetimeApp {
  DatetimeApp._();
  static final formatDate = DateFormat('yyyy-mm-dd');
  static final formatDate2 = DateFormat('EEEE, dd MM yyyy');
  static final formatDateTime = DateFormat('dd MMM yyyy hh : mm');
  static final formatDateDDD = DateFormat('MM');
  static final formatTime = DateFormat('hh : mm');
  static final formatDatePerforma2 = DateFormat('dd/MM');

  static String? objectToStr(DateTime? date) {
    try {
      if (date == null) {
        return null;
      }
      return formatDate.format(date);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static DateTime? strToObject(String? date) {
    try {
      if (date == null) {
        return null;
      }
      return formatDate.parse(date);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static String? datePerforma(String date) {
    try {
      final dateObj = DateTime.parse(date);
      
      return formatDatePerforma2.format(dateObj);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
