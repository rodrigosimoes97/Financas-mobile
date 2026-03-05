import 'package:local_auth/local_auth.dart';
class BiometricLockService { final _localAuth = LocalAuthentication(); Future<bool> authenticate() async => _localAuth.authenticate(localizedReason: 'Confirme sua identidade para acessar o app.'); }
