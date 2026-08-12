-- Formulário de onboarding do cliente (form.html)
CREATE TABLE IF NOT EXISTS formularios (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  cliente_id text NOT NULL,
  slug text UNIQUE NOT NULL,
  status text DEFAULT 'pendente',
  etapa_atual integer DEFAULT 1,
  preenchido_em timestamp,
  created_at timestamp DEFAULT now()
);

CREATE TABLE IF NOT EXISTS formulario_respostas (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  formulario_id uuid REFERENCES formularios(id) ON DELETE CASCADE,
  campo text NOT NULL,
  valor text,
  updated_at timestamp DEFAULT now(),
  UNIQUE(formulario_id, campo)
);

ALTER TABLE formularios ENABLE ROW LEVEL SECURITY;
ALTER TABLE formulario_respostas ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public access to formularios" ON formularios FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "Public access to formulario_respostas" ON formulario_respostas FOR ALL USING (true) WITH CHECK (true);

CREATE INDEX IF NOT EXISTS idx_formularios_slug ON formularios(slug);
CREATE INDEX IF NOT EXISTS idx_formulario_respostas_formulario_id ON formulario_respostas(formulario_id);

COMMENT ON TABLE formularios IS 'Uma linha por cliente/slug — controla status e progresso do formulário de onboarding preenchido em form.html';
COMMENT ON TABLE formulario_respostas IS 'Respostas do formulário de onboarding, uma linha por campo (mesmo padrão da tabela dossie)';
