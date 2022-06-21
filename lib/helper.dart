import 'package:intl/intl.dart';

final formatCurrency = new NumberFormat.simpleCurrency();

var noSimbolInUSFormat = new NumberFormat.currency(locale: "en_ID", symbol: "");
