#!/bin/bash

# MIRAGE CTF - Script d'arrêt pour étudiants
# Usage: ./stop-lab.sh

echo "🛑 Arrêt de Mirage CTF..."

# Arrêter tous les conteneurs
docker-compose down

echo "✅ Tous les services ont été arrêtés."
echo ""
echo "Pour redémarrer: ./start-lab.sh"
echo "Pour reset complet: ./reset-lab.sh"