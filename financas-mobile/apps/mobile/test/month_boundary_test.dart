import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
void main() { test('Vira ano corretamente em dezembro', () { final result = assignInvoiceMonth(transactionDate: DateTime(2026, 12, 31), closingDay: 15); expect(result.year, 2027); expect(result.month, 1); }); }
