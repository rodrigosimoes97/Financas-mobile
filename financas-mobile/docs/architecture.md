# Arquitetura

Camadas: Presentation (Flutter/Riverpod/GoRouter), Domain (regras), Data (Drift + Supabase + sync).

Offline-first: UI lê Drift, mutações entram em fila local, sync incremental por updated_at e resolução last-write-wins.
