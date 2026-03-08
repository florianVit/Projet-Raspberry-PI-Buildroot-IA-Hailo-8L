# Projet-Raspberry-PI-Buildroot-IA-Hailo-8L


---

## 📌 Présentation du projet

Ce projet vise à générer une image Linux minimale et personnalisée via **Buildroot**, optimisée pour le **Raspberry Pi 5**, intégrant l'accélérateur **Hailo-8L** pour le traitement IA, ainsi qu'une stack de **monitoring** (Telegraf, Grafana, etc.).

---

## 🎯 Objectifs du projet

- Créer un système embarqué léger et stable
- Exploiter les capacités d’accélération du **Hailo-8L**
- Monitorer les ressources avec **Telegraf**
- Déployer des modèles IA via le SDK Hailo 
- Documenter l’ensemble pour reproductibilité et aider pour la suite du projet

---

## 📂 Documentation

Le dossier Github contient :
- Un dossier [`/Packages-Buildroot`](./Package-Buildroot) avec les divers packages pour utiliser ultralytics et hailo sur un buildroot
- Les divers fiches techniques pour aider dans l'installation et solutions à des erreurs

---

## 🤖 Ultralytics via Buildroot

L’outil **Ultralytics** a été intégré manuellement et vous pourrez retrouvez les packages nécessaires dans le dossier buildroot pour son utilisation dans le systeme embarqué

---

## ⚡ Hailo-8L et Buildroot

Nous avons intégré :
- Le **HailoRT**
- Le **driver Hailo**

---

## 📈 Monitoring

- telegraf → collecte les métriques système
- possibilité d’export vers InfluxDB ou Grafana (sur réseau local)

---

### Par : Julien REYNAUD & Florian VITOUX
