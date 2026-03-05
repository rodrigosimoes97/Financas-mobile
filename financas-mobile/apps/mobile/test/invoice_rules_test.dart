import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
void main() {
  test('Atribui fatura atual quando compra no dia de fechamento', () { final result = assignInvoiceMonth(transactionDate: DateTime(2026, 3, 10), closingDay: 10); expect(result.month, 3); });
  test('Atribui próxima fatura quando compra após fechamento', () { final result = assignInvoiceMonth(transactionDate: DateTime(2026, 3, 11), closingDay: 10); expect(result.month, 4); });
}
