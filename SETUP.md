# Setup — Curty Capital

## Pré-requisitos

- Conta GitHub
- Conta Supabase
- Conta Vercel

## 1. GitHub

### Criar repositório

1. Acesse https://github.com/new
2. Nome: `curty-capital`
3. Descrição: `CRM Panel for Curty Capital`
4. Privado ou público (sua escolha)
5. Clique em "Create repository"

### Fazer push local

```bash
cd curty-capital
git remote add origin https://github.com/seu-usuario/curty-capital.git
git push -u origin main
```

## 2. Supabase

### Criar projeto

1. Acesse https://supabase.com
2. Clique em "New Project"
3. Nome: `curty-capital`
4. Selecione a região mais próxima
5. Defina uma senha forte para o database
6. Clique em "Create new project"

### Criar tabelas

1. Na aba "SQL Editor", clique em "New Query"
2. Cole o conteúdo do arquivo `supabase.sql`
3. Clique em "Run"

### Obter credenciais

1. Vá para Settings → API
2. Copie:
   - Project URL → `VITE_SUPABASE_URL`
   - anon public → `VITE_SUPABASE_ANON_KEY`

## 3. Variáveis de Ambiente

### Criar .env

```bash
cp .env.example .env
```

### Preencher com suas credenciais

```
VITE_SUPABASE_URL=https://seu-projeto.supabase.co
VITE_SUPABASE_ANON_KEY=sua-chave-anon
```

## 4. Vercel

### Conectar GitHub

1. Acesse https://vercel.com
2. Clique em "Import Project"
3. Clique em "Continue with GitHub"
4. Selecione o repositório `curty-capital`
5. Configure as variáveis de ambiente com suas credenciais Supabase

### Deploy automático

O deploy ocorrerá automaticamente quando você fizer push para a branch `main`.

## Verificar deploy

A URL do seu site será exibida no dashboard do Vercel.

Exemplo: `https://curty-capital.vercel.app`
