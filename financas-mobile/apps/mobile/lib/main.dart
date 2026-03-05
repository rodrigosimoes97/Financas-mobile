import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_client_pkg/supabase_client_pkg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final gateway = SupabaseGateway();
  const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');
  if (supabaseUrl.isNotEmpty && supabaseAnonKey.isNotEmpty) { await gateway.init(url: supabaseUrl, anonKey: supabaseAnonKey); }
  runApp(ProviderScope(overrides: [supabaseGatewayProvider.overrideWithValue(gateway)], child: const FinancasApp()));
}
final supabaseGatewayProvider = Provider<SupabaseGateway>((ref) => SupabaseGateway());
final isPremiumProvider = StateProvider<bool>((ref) => false);
class FinancasApp extends StatelessWidget { const FinancasApp({super.key});
  @override Widget build(BuildContext context) {
    final router = GoRouter(routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => Scaffold(
          body: navigationShell,
          floatingActionButton: FloatingActionButton(onPressed: () => _showAddTransaction(context), child: const Icon(Icons.add)),
          bottomNavigationBar: NavigationBar(selectedIndex: navigationShell.currentIndex, onDestinationSelected: navigationShell.goBranch, destinations: const [
            NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Início'),
            NavigationDestination(icon: Icon(Icons.swap_horiz), label: 'Transações'),
            NavigationDestination(icon: Icon(Icons.credit_card), label: 'Cartões'),
            NavigationDestination(icon: Icon(Icons.flag_outlined), label: 'Metas'),
          ]),
        ),
        branches: [
          StatefulShellBranch(routes: [GoRoute(path: '/', builder: (_, __) => const HomeScreen())]),
          StatefulShellBranch(routes: [GoRoute(path: '/transactions', builder: (_, __) => const TransactionsScreen())]),
          StatefulShellBranch(routes: [GoRoute(path: '/cards', builder: (_, __) => const CardsScreen())]),
          StatefulShellBranch(routes: [GoRoute(path: '/goals', builder: (_, __) => const GoalsScreen())]),
        ],
      ),
      GoRoute(path: '/settings', builder: (_, __) => const SettingsScreen()),
      GoRoute(path: '/paywall', builder: (_, __) => const PaywallScreen()),
    ]);
    return MaterialApp.router(title: 'Finanças', theme: AppTheme.light, darkTheme: AppTheme.dark, routerConfig: router);
  }
}
void _showAddTransaction(BuildContext context) => showModalBottomSheet(context: context, builder: (_) => const Padding(padding: EdgeInsets.all(16), child: Text('Nova transação (TODO formulário completo)')));
class HomeScreen extends ConsumerWidget { const HomeScreen({super.key});
  @override Widget build(BuildContext context, WidgetRef ref) { final premium = ref.watch(isPremiumProvider); return Scaffold(appBar: AppBar(title: const Text('Resumo do mês'), actions: [IconButton(onPressed: () => context.push('/settings'), icon: const Icon(Icons.settings))]), body: ListView(padding: const EdgeInsets.all(16), children: [if (!premium) ListTile(title: const Text('Premium'), trailing: FilledButton(onPressed: ()=>context.push('/paywall'), child: const Text('Ver'))), const Card(child: ListTile(title: Text('Receita'), subtitle: Text('R\$ 0,00'))), const Card(child: ListTile(title: Text('Despesa'), subtitle: Text('R\$ 0,00'))), const Card(child: ListTile(title: Text('Saldo do mês'), subtitle: Text('R\$ 0,00'))), const Card(child: ListTile(title: Text('Próxima fatura'), subtitle: Text('Fechamento em 3 dias')))])); }
}
class TransactionsScreen extends StatelessWidget { const TransactionsScreen({super.key}); @override Widget build(BuildContext c)=>const Scaffold(body: EmptyState(title:'Sem transações',subtitle:'Adicione sua primeira movimentação.')); }
class CardsScreen extends StatelessWidget { const CardsScreen({super.key}); @override Widget build(BuildContext c)=>const Scaffold(body: EmptyState(title:'Sem cartões',subtitle:'Cadastre um cartão para acompanhar faturas.')); }
class GoalsScreen extends StatelessWidget { const GoalsScreen({super.key}); @override Widget build(BuildContext c)=>const Scaffold(body: EmptyState(title:'Sem metas',subtitle:'Crie metas de limite ou economia.')); }
class SettingsScreen extends StatelessWidget { const SettingsScreen({super.key}); @override Widget build(BuildContext c)=>Scaffold(appBar: AppBar(title: const Text('Configurações')), body: ListView(children: const [ListTile(title: Text('Sincronizar agora')), ListTile(title: Text('Bloqueio biométrico (TODO)'))])); }
class PaywallScreen extends StatelessWidget { const PaywallScreen({super.key}); @override Widget build(BuildContext c)=>Scaffold(appBar: AppBar(title: const Text('Premium')), body: ListView(children: const [ListTile(title: Text('Widgets avançados')), ListTile(title: Text('Relatórios inteligentes')), ListTile(title: Text('Exportação PDF/CSV')), ListTile(title: Text('Metas ilimitadas')), ListTile(title: Text('Alertas inteligentes'))])); }
