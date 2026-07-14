// Supabase Configuration
const SUPABASE_URL = import.meta.env.VITE_SUPABASE_URL || localStorage.getItem('sb_url') || '';
const SUPABASE_KEY = import.meta.env.VITE_SUPABASE_ANON_KEY || localStorage.getItem('sb_key') || '';

// Initialize Supabase client (will be done in index.html)
let supabase = null;

// Initialize Supabase when available
async function initSupabase() {
  if (!window.supabase) {
    // Load Supabase JS library
    const script = document.createElement('script');
    script.src = 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2';
    document.head.appendChild(script);
    
    script.onload = () => {
      if (SUPABASE_URL && SUPABASE_KEY) {
        window.supabase = window.supabase.createClient(SUPABASE_URL, SUPABASE_KEY);
      }
    };
  }
}

// Get Supabase client
function getSupabase() {
  return window.supabase;
}

// Check if Supabase is configured
function isSupabaseConfigured() {
  return !!(SUPABASE_URL && SUPABASE_KEY && window.supabase);
}

// Initialize on page load
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initSupabase);
} else {
  initSupabase();
}
