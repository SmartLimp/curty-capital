const { createClient } = require('@supabase/supabase-js')

const supabase = createClient(
  'https://qjinabkrrkjspsmgkjty.supabase.co',
  'sb_publishable_Uf1wxNMLESwCZilCVfJajA_iaQXhK0q'
)

async function setup() {
  const { error } = await supabase.rpc('exec_sql', {
    sql: `
      CREATE TABLE IF NOT EXISTS dossie (
        id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
        cliente_id text NOT NULL,
        campo text NOT NULL,
        valor text,
        updated_at timestamp DEFAULT now(),
        UNIQUE(cliente_id, campo)
      );
      ALTER TABLE dossie ENABLE ROW LEVEL SECURITY;
      CREATE POLICY IF NOT EXISTS "Public access to dossie" ON dossie FOR ALL USING (true);
    `
  })
  if (error) console.error('Erro:', error)
  else console.log('Tabela criada com sucesso!')
}

setup()
