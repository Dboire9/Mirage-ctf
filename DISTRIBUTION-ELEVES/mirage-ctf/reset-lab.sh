#!/bin/bash

# MIRAGE CTF - Script de reset pour étudiants
# Usage: ./reset-lab.sh

echo "🔄 Reset complet de Mirage CTF..."

# Arrêter et supprimer tous les conteneurs, réseaux et volumes
docker-compose down -v --remove-orphans

# Supprimer les images si présentes localement (optionnel)
echo "🧹 Nettoyage des images locales..."
docker-compose pull -q

# Redémarrer
echo "🚀 Redémarrage..."
./start-lab.sh

echo "✅ Reset terminé !"