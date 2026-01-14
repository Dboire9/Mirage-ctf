# 🎯 Mirage CTF - Lab Étudiant

Bienvenue dans le laboratoire Mirage CTF ! Ce package contient tout le nécessaire pour démarrer le challenge de pentest.

## 📋 Prérequis

- **VirtualBox** (version 6.1 ou plus récente)
- **Vagrant** (version 2.2 ou plus récente)
- **8 GB RAM disponible** minimum
- **10 GB d'espace disque libre**

## 🚀 Installation Rapide

### 1️⃣ Télécharger les images Docker

1. Allez dans les **[Releases](https://github.com/Dboire9/Mirage-ctf/releases)**
2. Téléchargez le fichier `mirage-ctf-images.zip` de la dernière release
3. Décompressez-le dans ce répertoire (doit créer le dossier `images/`)

### 2️⃣ Lancer la machine virtuelle

```bash
vagrant up
```

⏱️ **Temps d'installation**: ~15-20 minutes (selon votre connexion internet)

### 2️⃣ Accéder au CTF

Une fois l'installation terminée, le CTF sera accessible via :

- 🌐 **WordPress**: http://localhost:8001
- 🔌 **API**: http://localhost:8002  
- 📤 **Upload**: http://localhost:8003
- 🍃 **NoSQL App**: http://localhost:8004
- 🤖 **Support Bot**: http://localhost:8005
- 🧠 **AI Assistant**: http://localhost:8006

## 📖 Guide Complet

Consultez le [STUDENT-GUIDE.md](mirage-ctf/STUDENT-GUIDE.md) pour :
- 🎯 Objectifs et règles
- 🗺️ Architecture des services
- 💡 Conseils et méthodologie
- 🏁 Format des flags

## 🔧 Commandes Utiles

```bash
# Démarrer/Arrêter la VM
vagrant up
vagrant halt

# Se connecter à la VM
vagrant ssh

# Redémarrer les services CTF
vagrant ssh -c "cd mirage-ctf && docker-compose restart"

# Voir les logs des services
vagrant ssh -c "cd mirage-ctf && docker-compose logs"

# Nettoyer complètement
vagrant destroy -f
```

## 🏆 Objectif

Trouvez tous les **20 flags** dispersés dans les différents services !

---

**🔥 Happy Hacking ! 🔥**

*En cas de problème technique, contactez votre formateur.*
