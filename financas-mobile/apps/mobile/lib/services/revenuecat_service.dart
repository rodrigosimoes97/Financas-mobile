abstract class MonetizationGateway { Future<bool> isPremium(); }
class RevenueCatStub implements MonetizationGateway { @override Future<bool> isPremium() async => false; }
