#!/bin/bash
git add .
git commit -m "deploy $(date '+%d/%m/%Y %H:%M')" || true
git push origin main
echo "✅ Deploy concluído!"
