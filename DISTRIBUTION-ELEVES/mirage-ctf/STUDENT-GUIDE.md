# 🎯 MIRAGE CTF - Guide Étudiant

Bienvenue dans **Mirage CTF**, un Capture The Flag complet avec **20 flags** à découvrir !

## 🚀 Démarrage Rapide

### Option 1: Vagrant (Recommandé)
```bash
# Une seule commande pour tout configurer !
vagrant up

# Attendre 5-10 minutes que tout s'installe automatiquement
# Ensuite, les services seront disponibles sur localhost:8001-8010
```

## 🌐 Services Disponibles

| Service | URL | Flags | Difficulté |
|---------|-----|-------|------------|
| **WordPress** | http://localhost:8001 | 2 flags |
| **API** | http://localhost:8002 | 6 flags |
| **Upload** | http://localhost:8003 | 4 flags | 
| **NoSQL** | http://localhost:8004 | 4 flags |
| **Support Bot** | http://localhost:8008 | 1 flag |
| **AI Assistant** | http://localhost:8009 | 1 flag |
| **Chaos Middleware** | http://localhost:8010 | 2 flags |

## 🎯 Objectifs

- **20 flags** au total
- **1300 points** maximum
- Flags de base: 50 points chacun
- Flags experts: 100 points chacun

## 🔧 Commandes Utiles

```bash
# Démarrer le lab
./start-lab.sh

# Arrêter le lab
./stop-lab.sh

# Reset complet (efface tout)
./reset-lab.sh

# Vérifier les conteneurs
docker-compose ps

# Voir les logs d'un service
docker-compose logs wordpress
docker-compose logs api
```

## 🧰 Outils Recommandés

### Navigateur
- **Extensions:** Wappalyzer, Cookie Editor, User-Agent Switcher
- **DevTools:** Network tab, Console, Application (Storage)

### CLI Tools (déjà installés dans la VM)
```bash
# Reconnaissance
nmap -sV -sC localhost -p 8001-8010

# Énumération web
dirb http://localhost:8001
nikto -h http://localhost:8001

# Tests API
curl -X POST http://localhost:8002/api/auth -H "Content-Type: application/json" -d '{"username":"test","password":"test"}'

# Analyse HTTP
curl -i http://localhost:8001
```

### Python/Scripts
```python
import requests
import json

# Test API
response = requests.post('http://localhost:8002/api/auth', 
    json={'username': 'admin', 'password': 'password'})
print(response.json())
```

## 🎯 Stratégie de Pentest

### 1. Reconnaissance
- Scanner les ports avec `nmap`
- Énumérer les technologies avec Wappalyzer
- Identifier les endpoints API

### 2. Énumération
- Tester les formulaires de login
- Chercher des fichiers cachés (`robots.txt`, `.git/`, etc.)
- Analyser les réponses HTTP et headers

### 3. Exploitation
- Injections SQL/NoSQL
- Cross-Site Scripting (XSS)
- Vulnerabilités d'upload de fichiers
- Manipulation de JWT
- Engineering social

### 4. Post-exploitation
- Escalation de privilèges
- Accès aux services internes
- Cache poisoning
- DoS/Stress testing

## ❓ Conseils

- **Lisez attentivement** les réponses d'erreur
- **Testez différents payloads** sur chaque input
- **Examinez le code source** des pages web
- **Suivez les redirections** et cookies
- **Documentez vos découvertes** au fur et à mesure

## 🚨 Problèmes Courants

### Services non accessibles
```bash
# Vérifier que les conteneurs tournent
docker-compose ps

# Redémarrer si nécessaire
./reset-lab.sh
```

### Port déjà utilisé
```bash
# Vérifier qui utilise le port
netstat -tlnp | grep 8001

# Changer le port dans docker-compose.yml si nécessaire
```

### VM lente
```bash
# Dans Vagrantfile, augmenter la RAM
vb.memory = "8192"  # 8GB au lieu de 4GB
vb.cpus = 4         # 4 CPU au lieu de 2

vagrant reload
```

## 📚 Ressources

- [OWASP Testing Guide](https://owasp.org/www-project-web-security-testing-guide/)
- [PortSwigger Web Security Academy](https://portswigger.net/web-security)
- [HackTricks](https://book.hacktricks.xyz/)

## 🏁 Format des Flags

Tous les flags suivent le format: `FLAG{description_de_la_vuln}`

**Bon pentest et bonne chance ! 🔥**

*En cas de problème technique, contactez votre formateur.*