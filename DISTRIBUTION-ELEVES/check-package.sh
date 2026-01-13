#!/bin/bash

set -e

echo "📦 Création du package de distribution Mirage CTF..."

# Vérification des images
IMAGES_DIR="images"
if [ ! -d "$IMAGES_DIR" ]; then
    echo "❌ Répertoire des images manquant!"
    exit 1
fi

echo "✅ Images Docker présentes ($(du -sh $IMAGES_DIR | cut -f1))"
echo "📋 Images disponibles:"
ls -1 images/*.tar.gz | sed 's|images/||; s|.tar.gz||' | sed 's/^/   - /'

echo ""
echo "📁 Structure du package:"
find . -type f -name "*.md" -o -name "*.yml" -o -name "*.sh" -o -name "Vagrantfile" | grep -v '.git' | sort | sed 's/^/   /'

echo ""
echo "🎯 Package prêt pour distribution!"
echo ""
echo "📤 Pour distribuer aux étudiants, vous pouvez:"
echo "   1. Compresser tout le répertoire: tar -czf mirage-ctf-student-lab.tar.gz DISTRIBUTION-ELEVES/"
echo "   2. Créer un repo GitHub privé et y pousser le contenu"
echo "   3. Utiliser un service de partage de fichiers (Google Drive, Dropbox, etc.)"
echo ""
echo "⚠️  ATTENTION: Les images font $(du -sh images/ | cut -f1) au total"
echo "   Assurez-vous d'avoir une connexion/service adapté pour la taille."