-- Criar tabela de clientes
CREATE TABLE clientes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nome text NOT NULL,
  empresa text,
  segmento text,
  cidade text,
  valor_mensal numeric DEFAULT 0,
  fase text DEFAULT 'Fase 1 — Diagnóstico',
  status text DEFAULT 'Ativo' CHECK (status IN ('Ativo', 'Inativo', 'Pausado')),
  data_inicio date,
  gestor text DEFAULT 'The Curtys',
  health_score numeric DEFAULT 50 CHECK (health_score >= 0 AND health_score <= 100),
  created_at timestamp DEFAULT now(),
  updated_at timestamp DEFAULT now()
);

-- Criar tabela de leads
CREATE TABLE leads (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nome text NOT NULL,
  empresa text NOT NULL,
  whatsapp text,
  canal text NOT NULL,
  etapa text DEFAULT 'Lead' CHECK (etapa IN ('Lead', 'Diagnóstico', 'Proposta', 'Fechado', 'Perdido')),
  valor numeric DEFAULT 0,
  observacoes text,
  motivo_perda text,
  virou_cliente boolean DEFAULT false,
  created_at timestamp DEFAULT now(),
  updated_at timestamp DEFAULT now()
);

-- Criar tabela de colunas do pipeline
CREATE TABLE pipeline_colunas (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nome text NOT NULL,
  ordem integer NOT NULL,
  created_at timestamp DEFAULT now()
);

-- Criar tabela de atividades
CREATE TABLE atividades (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  cliente_id uuid REFERENCES clientes(id) ON DELETE CASCADE,
  lead_id uuid REFERENCES leads(id) ON DELETE CASCADE,
  tipo text NOT NULL,
  titulo text NOT NULL,
  descricao text,
  created_at timestamp DEFAULT now()
);

-- Criar tabela de publicidade
CREATE TABLE publicidade (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  cliente_id uuid REFERENCES clientes(id) ON DELETE CASCADE,
  plataforma text NOT NULL CHECK (plataforma IN ('facebook', 'google')),
  mes text NOT NULL,
  dia integer NOT NULL CHECK (dia >= 1 AND dia <= 31),
  trafego numeric DEFAULT 0,
  orcamentos integer DEFAULT 0,
  vendas integer DEFAULT 0,
  faturamento numeric DEFAULT 0,
  created_at timestamp DEFAULT now(),
  updated_at timestamp DEFAULT now()
);

-- Habilitar RLS
ALTER TABLE clientes ENABLE ROW LEVEL SECURITY;
ALTER TABLE leads ENABLE ROW LEVEL SECURITY;
ALTER TABLE pipeline_colunas ENABLE ROW LEVEL SECURITY;
ALTER TABLE atividades ENABLE ROW LEVEL SECURITY;
ALTER TABLE publicidade ENABLE ROW LEVEL SECURITY;

-- Criar políticas de acesso público
CREATE POLICY "Public access to clientes" ON clientes FOR ALL USING (true);
CREATE POLICY "Public access to leads" ON leads FOR ALL USING (true);
CREATE POLICY "Public access to pipeline_colunas" ON pipeline_colunas FOR ALL USING (true);
CREATE POLICY "Public access to atividades" ON atividades FOR ALL USING (true);
CREATE POLICY "Public access to publicidade" ON publicidade FOR ALL USING (true);

-- Inserir colunas padrão
INSERT INTO pipeline_colunas (nome, ordem) VALUES
  ('Lead', 1),
  ('Diagnóstico', 2),
  ('Proposta', 3),
  ('Fechado', 4);
