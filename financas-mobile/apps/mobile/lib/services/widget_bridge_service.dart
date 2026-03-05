import 'dart:convert';
import 'package:flutter/services.dart';
class WidgetBridgeService { static const _channel = MethodChannel('financas/widget_bridge'); Future<void> pushWidgetPayload(Map<String, dynamic> payload) async { await _channel.invokeMethod('saveWidgetData', jsonEncode(payload)); } }
