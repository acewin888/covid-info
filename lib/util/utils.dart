
import 'package:intl/intl.dart';

String formatNumber(int number) {
  return NumberFormat('#,##0', 'en_us').format(number);
}