import 'package:supabase_flutter/supabase_flutter.dart';
class SupabaseGateway { SupabaseClient? _client;
  Future<void> init({required String url, required String anonKey}) async { await Supabase.initialize(url: url, anonKey: anonKey); _client = Supabase.instance.client; }
  bool get enabled => _client != null; SupabaseClient? get client => _client;
}
