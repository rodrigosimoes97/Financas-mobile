# Contratos Supabase esperados
- profiles (id, email, created_at)
- categories (id, user_id, name, icon, type, created_at, updated_at)
- accounts (id, user_id, name, type, created_at, updated_at)
- credit_cards (id, user_id, name, closing_day, due_day, created_at, updated_at)
- invoices (id, user_id, credit_card_id, month, status, closing_date, due_date, total, created_at, updated_at)
- transactions (id, user_id, account_id, category_id, credit_card_id nullable, invoice_id nullable, type, amount, date, note, is_installment, installment_group_id, installment_number, installment_total, created_at, updated_at)
- goals (id, user_id, type, category_id nullable, target_amount, current_amount, month, monthly_limit, deadline, created_at, updated_at)
- device_tokens (id, user_id, token, platform, created_at)
