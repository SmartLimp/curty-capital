# Instruções de Setup — Curty Capital

## ✅ O que foi preparado

A estrutura do projeto está 100% pronta em `/tmp/curty-capital`. Agora você precisa seguir os passos abaixo para publicar.

## 🔧 Passo 1: GitHub

### 1.1 Criar repositório

1. Acesse https://github.com/new
2. Preencha:
   - **Repository name**: `curty-capital`
   - **Description**: CRM Panel for Curty Capital
   - **Visibility**: Public (ou Private)
3. Clique em **"Create repository"**

### 1.2 Fazer push do código local

```bash
cd /tmp/curty-capital
git remote add origin https://github.com/SEU-USUARIO/curty-capital.git
git branch -M main
git push -u origin main
```

**Substitua `SEU-USUARIO` pelo seu username do GitHub.**

## 🗄️ Passo 2: Supabase

### 2.1 Criar projeto

1. Acesse https://supabase.com
2. Clique em **"New Project"** (ou **"Create a new project"**)
3. Preencha:
   - **Project name**: `curty-capital`
   - **Database password**: Use uma senha forte
   - **Region**: Selecione a mais próxima (ex: South America - São Paulo)
4. Clique em **"Create new project"** e aguarde 2-3 minutos

### 2.2 Criar as tabelas

1. Na aba **"SQL Editor"**, clique em **"New Query"**
2. Abra o arquivo `supabase.sql` e copie **TODO** o conteúdo
3. Cole na query do Supabase
4. Clique em **"Run"** (ou CMD+Enter)
5. Aguarde a execução (deve aparecer "Execution successful")

### 2.3 Obter as credenciais

1. Clique em **"Settings"** (engrenagem no canto inferior esquerdo)
2. Selecione **"API"**
3. Copie:
   - **Project URL**: Exemplo `https://xyzabc.supabase.co`
   - **anon public**: A chave que começa com `eyJhb...`

**Salve essas informações em um lugar seguro!**

## 🔐 Passo 3: Configurar variáveis

### 3.1 Criar arquivo .env

```bash
cd /tmp/curty-capital
cp .env.example .env
```

### 3.2 Editar .env

Abra o arquivo `.env` e preencha:

```
VITE_SUPABASE_URL=https://xyzabc.supabase.co
VITE_SUPABASE_ANON_KEY=eyJhb...sua-chave-aqui...
```

**Cole exatamente o que você copiou do Supabase.**

## 🚀 Passo 4: Vercel

### 4.1 Conectar repositório

1. Acesse https://vercel.com
2. Clique em **"Add New..."** → **"Project"**
3. Clique em **"Continue with GitHub"**
4. Selecione o repositório **`curty-capital`**
5. Clique em **"Import"**

### 4.2 Configurar variáveis de ambiente

1. Na tela de configuração, procure por **"Environment Variables"**
2. Adicione:
   - **Name**: `VITE_SUPABASE_URL`
   - **Value**: (Cole a URL do Supabase)
3. Clique em **"Add"**
4. Repita para `VITE_SUPABASE_ANON_KEY`
5. Clique em **"Deploy"**

### 4.3 Aguardar deploy

O Vercel vai mostrar o progresso. Quando ficar verde com ✓, o site está online!

A URL será algo como: **`https://curty-capital.vercel.app`**

## ✨ Pronto!

Seu painel está online! Acesse a URL do Vercel e comece a usar:

1. **Adicione clientes** na aba "Clientes"
2. **Crie leads** na aba "Pipeline"
3. **Rastreie publicidade** na aba "Tráfego"
4. Todos os dados são salvos no Supabase automaticamente

## 📝 Notas importantes

- O arquivo `.env` **nunca deve ser commitado** (está no .gitignore)
- O Vercel detectará mudanças automaticamente quando você fazer `git push`
- Para fazer deploy manual: `bash deploy.sh` na pasta do projeto

## 🆘 Problemas?

Se algo não funcionar:

1. Verifique se as variáveis de ambiente estão corretas no Vercel
2. Verifique se o SQL foi executado com sucesso no Supabase
3. Verifique o console do navegador (F12) para ver mensagens de erro

---

**Bom trabalho! Seu CRM está pronto para usar.** 🎉
