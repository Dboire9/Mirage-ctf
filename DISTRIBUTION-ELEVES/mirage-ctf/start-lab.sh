#!/bin/bash

# MIRAGE CTF - Script de démarrage pour étudiants
# Usage: ./start-lab.sh

set -e

echo "🚀 Démarrage de Mirage CTF..."

# Vérifier que Docker est installé
if ! command -v docker &> /dev/null; then
    echo "❌ Docker n'est pas installé. Utilisez 'vagrant up' pour tout configurer automatiquement."
    exit 1
fi

# Vérifier que docker-compose est installé
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose n'est pas installé. Utilisez 'vagrant up' pour tout configurer automatiquement."
    exit 1
fi

# Démarrer les services
echo "📦 Pull des images Docker..."
docker-compose pull -q

echo "🔄 Démarrage des conteneurs..."
docker-compose up -d

# Attendre que les services soient prêts
echo "⏳ Attente que les services soient opérationnels..."
sleep 30

# Vérification des services
echo ""
echo "🔍 Vérification des services..."

services=(
    "8001:WordPress"
    "8002:API"
    "8003:Upload"
    "8004:NoSQL"
    "8008:Support Bot"
    "8009:AI Assistant" 
    "8010:Chaos"
)

all_ok=true
for service in "${services[@]}"; do
    IFS=':' read -r port name <<< "$service"
    if curl -s --max-time 5 "http://localhost:$port" > /dev/null 2>&1; then
        echo "✅ $name (Port $port): OK"
    else
        echo "❌ $name (Port $port): ERREUR"
        all_ok=false
    fi
done

echo ""
if [ "$all_ok" = true ]; then
    echo "🎉 MIRAGE CTF EST PRÊT !"
    echo "=================================="
    echo "🌐 Services disponibles:"
    echo "  WordPress:      http://localhost:8001"
    echo "  API:            http://localhost:8002"
    echo "  Upload:         http://localhost:8003"
    echo "  NoSQL:          http://localhost:8004"
    echo "  Support Bot:    http://localhost:8008"
    echo "  AI Assistant:   http://localhost:8009"
    echo "  Chaos:          http://localhost:8010"
    echo ""
    echo "📚 Guide: STUDENT-GUIDE.md"
    echo "🎯 Objectif: 20 flags (1300 points)"
    echo "=================================="
    echo "Bon pentest ! 🔥"
else
    echo "⚠️  Certains services ont des problèmes."
    echo "Essayez: ./reset-lab.sh puis ./start-lab.sh"
fi