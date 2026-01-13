#!/bin/bash

set -e

echo "🚀 Chargement des images Docker Mirage CTF..."

# Vérifier que Docker est installé et fonctionne
if ! command -v docker &> /dev/null; then
    echo "❌ Docker n'est pas installé. Veuillez installer Docker d'abord."
    exit 1
fi

if ! docker info &> /dev/null; then
    echo "❌ Docker n'est pas en cours d'exécution. Démarrez Docker d'abord."
    exit 1
fi

# Répertoire contenant les images
IMAGES_DIR="$(dirname "$0")/images"

if [ ! -d "$IMAGES_DIR" ]; then
    echo "❌ Répertoire des images non trouvé: $IMAGES_DIR"
    exit 1
fi

# Liste des images à charger
IMAGES=(
    "wordpress"
    "api"
    "upload"
    "nosql-app"
    "support-bot"
    "ai-assistant"
    "chaos-middleware"
    "internal-service"
)

echo "📦 Chargement des images..."

for image in "${IMAGES[@]}"; do
    image_file="$IMAGES_DIR/${image}.tar.gz"
    
    if [ ! -f "$image_file" ]; then
        echo "⚠️  Image manquante: $image_file"
        continue
    fi
    
    echo "   📥 Chargement de $image..."
    gunzip -c "$image_file" | docker load
    
    if [ $? -eq 0 ]; then
        echo "   ✅ $image chargée avec succès"
    else
        echo "   ❌ Erreur lors du chargement de $image"
    fi
done

echo ""
echo "🔍 Images Docker chargées:"
docker images | grep mirage-ctf

echo ""
echo "✨ Toutes les images sont prêtes !"
echo "💡 Vous pouvez maintenant lancer: vagrant up"