import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class NotificationService { final _plugin = FlutterLocalNotificationsPlugin(); Future<void> init() async { await _plugin.initialize(const InitializationSettings(android: AndroidInitializationSettings('@mipmap/ic_launcher'), iOS: DarwinInitializationSettings())); } Future<void> scheduleInvoiceAlerts() async {} }
