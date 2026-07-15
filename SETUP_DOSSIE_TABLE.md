# Configuração da Tabela Dossie

## Status Atual
❌ A tabela `dossie` ainda não foi criada no Supabase.

## Como Criar a Tabela

### Opção 1: Via Supabase Dashboard (RECOMENDADO)

1. Acesse: https://qjinabkrrkjspsmgkjty.supabase.co/editor
2. Cole este SQL:

```sql
CREATE TABLE IF NOT EXISTS dossie (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  cliente_id text NOT NULL,
  campo text NOT NULL,
  valor text,
  updated_at timestamp DEFAULT now(),
  UNIQUE(cliente_id, campo)
);

ALTER TABLE dossie ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public access to dossie" ON dossie
  FOR ALL
  USING (true)
  WITH CHECK (true);

CREATE INDEX idx_dossie_cliente_id ON dossie(cliente_id);
CREATE INDEX idx_dossie_campo ON dossie(campo);

COMMENT ON TABLE dossie IS 'Armazena campos editáveis do dossiê dos clientes';
COMMENT ON COLUMN dossie.cliente_id IS 'ID do cliente (ex: smartlimp)';
COMMENT ON COLUMN dossie.campo IS 'Nome do campo editável (ex: d-razao, d-cnpj)';
COMMENT ON COLUMN dossie.valor IS 'Valor salvo do campo';
COMMENT ON COLUMN dossie.updated_at IS 'Data/hora da última atualização';
```

3. Clique **"Run"** ou pressione **Ctrl+Enter**
4. Aguarde a mensagem de sucesso: "Table created successfully"

### Opção 2: Via arquivo SQL

```bash
# Copie o arquivo SQL
cat migrations/001_create_dossie_table.sql

# Ou execute diretamente se tiver acesso CLI
supabase db pull  # Para sincronizar schema local
supabase db push  # Para enviar para Supabase
```

## Verificar se a Tabela Existe

```bash
node setup-db-alternative.js
```

Resultado esperado: `✅ Tabela dossie já existe!`

## Estrutura da Tabela

| Campo | Tipo | Descrição |
|-------|------|-----------|
| `id` | UUID | Identificador único |
| `cliente_id` | TEXT | ID do cliente (ex: "smartlimp") |
| `campo` | TEXT | Nome do campo (ex: "d-razao") |
| `valor` | TEXT | Valor salvo |
| `updated_at` | TIMESTAMP | Data da última atualização |

### Chave Única
- `UNIQUE(cliente_id, campo)` - Garante um único valor por cliente e campo

### Índices
- `idx_dossie_cliente_id` - Para queries rápidas por cliente
- `idx_dossie_campo` - Para queries rápidas por campo

## Segurança (RLS)

A política `"Public access to dossie"` permite:
- SELECT: Qualquer pessoa pode ler
- INSERT/UPDATE: Qualquer pessoa pode escrever
- DELETE: Qualquer pessoa pode deletar

⚠️ **NOTA**: Para produção, ajuste as políticas RLS para restringir acesso.

## Após Criar a Tabela

1. O painel salva automaticamente campos na tabela `dossie`
2. Ao abrir um dossiê, carrega dados do Supabase
3. Loading spinner mostra enquanto busca dados

## Campos Salvos Automaticamente

- Dados: razão social, CNPJ, segmento, cidade, ticket, público-alvo
- Contato: responsável, WhatsApp, e-mail
- Contrato: início, modelo, área, base, serviço, nível
- Acessos: BM, contas de anúncios, pixels, Google Analytics, etc.
- Diagnóstico: todos os 8 blocos

## Suporte

Se a tabela não foi criada:
1. Verifique a URL do Supabase: https://qjinabkrrkjspsmgkjty.supabase.co
2. Verifique se você tem acesso ao projeto
3. Tente executar novamente via Dashboard SQL Editor
