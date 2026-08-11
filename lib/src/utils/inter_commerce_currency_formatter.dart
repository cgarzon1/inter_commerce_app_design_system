import 'package:intl/intl.dart';

abstract final class InterCommerceCurrencyFormatter {
  static String format(
    num amount, {
    String symbol = r'$',
    String locale = 'en_US',
    int? decimalDigits,
  }) {
    final hasCents = amount % 1 != 0;
    final digits = decimalDigits ?? (hasCents ? 2 : 0);
    final format = NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: digits,
    );
    return format.format(amount);
  }
}
