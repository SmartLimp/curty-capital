# 📋 Resumo da Infraestrutura — Curty Capital

## 🎯 Status Atual

✅ **ESTRUTURA LOCAL PRONTA** em `/tmp/curty-capital`

## 📁 Arquivos Criados

```
curty-capital/
├── index.html                 ← Painel completo (130KB)
├── config.js                  ← Configuração Supabase
├── deploy.sh                  ← Script de deploy (executável)
├── package.json               ← Dependências npm
├── vercel.json                ← Config Vercel
├── supabase.sql               ← Schema das tabelas
├── .env.example               ← Variáveis de exemplo
├── .gitignore                 ← Arquivos ignorados
├── README.md                  ← Documentação principal
├── SETUP.md                   ← Setup simplificado
├── INSTRUCOES.md              ← Instruções detalhadas em PT
└── .git/                      ← Repositório Git inicializado
```

## 🔄 Próximos Passos

### 1️⃣ GITHUB (5 min)
- [ ] Criar repositório em https://github.com/new
- [ ] Nome: `curty-capital`
- [ ] Executar:
```bash
cd /tmp/curty-capital
git remote add origin https://github.com/SEU-USUARIO/curty-capital.git
git push -u origin main
```

### 2️⃣ SUPABASE (10 min)
- [ ] Criar projeto em https://supabase.com
- [ ] Nome: `curty-capital`
- [ ] Copiar SQL do arquivo `supabase.sql` para SQL Editor
- [ ] Executar o SQL
- [ ] Copiar credenciais (URL + ANON_KEY)

### 3️⃣ ARQUIVO .env (2 min)
- [ ] Criar `.env` copiando `.env.example`
- [ ] Preencher com credenciais do Supabase

### 4️⃣ VERCEL (5 min)
- [ ] Conectar repositório GitHub
- [ ] Adicionar variáveis de ambiente
- [ ] Fazer deploy

### 5️⃣ DEPLOY (1 min)
- [ ] Executar: `bash deploy.sh`
- [ ] Copiar URL do Vercel

---

## 📊 Tabelas do Supabase

```sql
CLIENTES          — Gerenciamento de clientes
  ├─ id, nome, empresa, segmento, cidade
  ├─ valor_mensal, fase, status (Ativo/Inativo/Pausado)
  └─ health_score, created_at

LEADS             — Pipeline de vendas
  ├─ id, nome, empresa, whatsapp, canal
  ├─ etapa (Lead/Diagnóstico/Proposta/Fechado/Perdido)
  ├─ valor, observacoes, motivo_perda
  └─ created_at, updated_at

PUBLICIDADE       — Campanhas Facebook/Google
  ├─ cliente_id, plataforma (facebook/google)
  ├─ mes, dia, trafego, orcamentos, vendas
  └─ faturamento, created_at

ATIVIDADES        — Log de ações
  ├─ cliente_id, lead_id
  ├─ tipo, titulo, descricao
  └─ created_at

PIPELINE_COLUNAS  — Etapas do funil
  ├─ nome, ordem
  └─ created_at
```

## 🔐 RLS (Row Level Security)

✅ **ATIVADO** para todas as tabelas
✅ **Politica pública** habilitada temporariamente

## 🚀 Features Implementadas

- ✅ Morning View (visão geral)
- ✅ Clientes com status (Ativo/Inativo/Pausado)
- ✅ Pipeline comercial (Lead → Diagnóstico → Proposta → Fechado)
- ✅ Rastreamento de leads
- ✅ Publicidade (Facebook + Google Ads)
- ✅ Forecast automático
- ✅ Relatórios
- ✅ localStorage sincronizado

## 📝 Notas

1. **Arquivo `.env` não deve ser versionado** (está no .gitignore)
2. **O Vercel fará deploy automático** quando você fizer `git push`
3. **RLS está público** — considere restringir depois se necessário
4. **Supabase URL + Key** vão no Vercel como variáveis de ambiente

## 🔗 Links Úteis

- GitHub: https://github.com/new
- Supabase: https://supabase.com
- Vercel: https://vercel.com
- Documentação: Veja INSTRUCOES.md

---

**Tudo pronto para publicar! 🚀**
