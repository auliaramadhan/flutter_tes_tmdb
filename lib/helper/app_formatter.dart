import 'package:intl/intl.dart';

abstract class AppFormatter {
  static final formatCurrency = NumberFormat.currency(decimalDigits: 0,locale: 'id_ID'  );

  static String? setCurrency(num number, {empty = false}) {
    try {
      return formatCurrency.format(number);
    } catch (e) {
      print(e);
      return empty ? "" : null;
    }
  }

  static num? getNum(String number) {
    try {
      return formatCurrency.parse(number);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
