import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
part 'app_database.g.dart';
class Accounts extends Table { TextColumn get id => text()(); TextColumn get userId => text()(); TextColumn get name => text()(); TextColumn get type => text()(); DateTimeColumn get updatedAt => dateTime()(); @override Set<Column> get primaryKey => {id}; }
class Categories extends Table { TextColumn get id => text()(); TextColumn get userId => text()(); TextColumn get name => text()(); TextColumn get type => text()(); DateTimeColumn get updatedAt => dateTime()(); @override Set<Column> get primaryKey => {id}; }
class CreditCards extends Table { TextColumn get id => text()(); TextColumn get userId => text()(); TextColumn get name => text()(); IntColumn get closingDay => integer()(); IntColumn get dueDay => integer()(); DateTimeColumn get updatedAt => dateTime()(); @override Set<Column> get primaryKey => {id}; }
class Invoices extends Table { TextColumn get id => text()(); TextColumn get userId => text()(); TextColumn get creditCardId => text()(); TextColumn get month => text()(); TextColumn get status => text()(); RealColumn get total => real()(); DateTimeColumn get closingDate => dateTime()(); DateTimeColumn get dueDate => dateTime()(); DateTimeColumn get updatedAt => dateTime()(); @override Set<Column> get primaryKey => {id}; }
class Transactions extends Table { TextColumn get id => text()(); TextColumn get userId => text()(); TextColumn get type => text()(); RealColumn get amount => real()(); DateTimeColumn get date => dateTime()(); TextColumn get paymentMethod => text()(); DateTimeColumn get updatedAt => dateTime()(); @override Set<Column> get primaryKey => {id}; }
class Goals extends Table { TextColumn get id => text()(); TextColumn get userId => text()(); TextColumn get type => text()(); RealColumn get targetAmount => real()(); RealColumn get currentAmount => real()(); DateTimeColumn get updatedAt => dateTime()(); @override Set<Column> get primaryKey => {id}; }
class PendingMutations extends Table { IntColumn get id => integer().autoIncrement()(); TextColumn get entity => text()(); TextColumn get entityId => text()(); TextColumn get operation => text()(); TextColumn get payload => text()(); DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)(); }
@DriftDatabase(tables: [Accounts, Categories, CreditCards, Invoices, Transactions, Goals, PendingMutations])
class AppDatabase extends _$AppDatabase { AppDatabase() : super(_openConnection()); @override int get schemaVersion => 1; }
LazyDatabase _openConnection() => LazyDatabase(() async { final dir = await getApplicationDocumentsDirectory(); return NativeDatabase(File(p.join(dir.path, 'financas.sqlite'))); });
