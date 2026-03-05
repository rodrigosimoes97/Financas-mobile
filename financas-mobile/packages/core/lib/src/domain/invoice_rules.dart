DateTime assignInvoiceMonth({required DateTime transactionDate, required int closingDay}) {
  final date = DateTime(transactionDate.year, transactionDate.month, transactionDate.day);
  if (date.day <= closingDay) return DateTime(date.year, date.month);
  return date.month == 12 ? DateTime(date.year + 1, 1) : DateTime(date.year, date.month + 1);
}
