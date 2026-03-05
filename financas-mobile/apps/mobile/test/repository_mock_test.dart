import 'package:flutter_test/flutter_test.dart';
class FakeRepository { Future<List<String>> fetchTransactions({required int page}) async => ['tx$page']; }
void main() { test('Paginação retorna página esperada', () async { final repo = FakeRepository(); final page = await repo.fetchTransactions(page: 2); expect(page.first, 'tx2'); }); }
