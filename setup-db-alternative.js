const { createClient } = require('@supabase/supabase-js')

const supabase = createClient(
  'https://qjinabkrrkjspsmgkjty.supabase.co',
  'sb_publishable_Uf1wxNMLESwCZilCVfJajA_iaQXhK0q'
)

async function setup() {
  try {
    console.log('Tentando criar tabela dossie via Supabase...')

    // Tentar fazer uma query simples para verificar se a tabela existe
    const { data, error } = await supabase
      .from('dossie')
      .select('*')
      .limit(1)

    if (error && error.code === 'PGRST116') {
      // Tabela não existe
      console.log('❌ Tabela dossie não encontrada')
      console.log('')
      console.log('⚠️  Para criar a tabela, você precisa usar o SQL Editor do Supabase Dashboard:')
      console.log('')
      console.log('1. Acesse: https://qjinabkrrkjspsmgkjty.supabase.co/editor')
      console.log('2. Cole este SQL:')
      console.log('')
      console.log(`CREATE TABLE IF NOT EXISTS dossie (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  cliente_id text NOT NULL,
  campo text NOT NULL,
  valor text,
  updated_at timestamp DEFAULT now(),
  UNIQUE(cliente_id, campo)
);

ALTER TABLE dossie ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Public access to dossie" ON dossie FOR ALL USING (true);`)
      console.log('')
      console.log('3. Clique "Run" ou pressione Ctrl+Enter')
      console.log('4. Aguarde a confirmação "Table created successfully"')
      console.log('')
    } else if (error) {
      console.log('❌ Erro ao verificar tabela:', error.message)
      console.log('Código do erro:', error.code)
    } else {
      console.log('✅ Tabela dossie já existe!')
      console.log('Registros na tabela:', data.length)
    }
  } catch (e) {
    console.error('❌ Erro inesperado:', e)
  }
}

setup()
