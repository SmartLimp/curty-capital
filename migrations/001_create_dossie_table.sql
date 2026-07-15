-- Criar tabela dossie para armazenar campos editáveis do dossiê
CREATE TABLE IF NOT EXISTS dossie (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  cliente_id text NOT NULL,
  campo text NOT NULL,
  valor text,
  updated_at timestamp DEFAULT now(),
  UNIQUE(cliente_id, campo)
);

-- Habilitar Row Level Security
ALTER TABLE dossie ENABLE ROW LEVEL SECURITY;

-- Criar política de acesso público (para prototipagem - ajuste conforme necessário)
CREATE POLICY "Public access to dossie" ON dossie
  FOR ALL
  USING (true)
  WITH CHECK (true);

-- Criar índice para queries mais rápidas
CREATE INDEX idx_dossie_cliente_id ON dossie(cliente_id);
CREATE INDEX idx_dossie_campo ON dossie(campo);

-- Adicionar comentário à tabela
COMMENT ON TABLE dossie IS 'Armazena campos editáveis do dossiê dos clientes';
COMMENT ON COLUMN dossie.cliente_id IS 'ID do cliente (ex: smartlimp)';
COMMENT ON COLUMN dossie.campo IS 'Nome do campo editável (ex: d-razao, d-cnpj)';
COMMENT ON COLUMN dossie.valor IS 'Valor salvo do campo';
COMMENT ON COLUMN dossie.updated_at IS 'Data/hora da última atualização';
