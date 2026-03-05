# Finanças Mobile

Monorepo Flutter (Android/iOS) para gestão financeira pessoal com arquitetura escalável, offline-first, segurança reforçada e base pronta para produção.

## Estrutura
- `apps/mobile`
- `packages/core`
- `packages/supabase_client`
- `tools/scripts`
- `docs`

## Execução
```bash
cd apps/mobile
flutter pub get
flutter run --dart-define=SUPABASE_URL=https://SEU-PROJETO.supabase.co --dart-define=SUPABASE_ANON_KEY=SUA_CHAVE
```
