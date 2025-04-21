# infinity_stores - Système de boutiques avancé pour RedM

Module de boutiques/magasins modulaire et entièrement personnalisable pour RedM, développé par Shepard & iiRedDev (ALTITUDE-DEV.COM). Conçu pour une intégration parfaite avec Infinity Core et les autres modules Infinity.

## ✨ Fonctionnalités principales

- Multiples types de boutiques (généralistes, armureries, magasins uniques, etc.)
- Items et catégories personnalisables via `config.lua`
- Interface utilisateur web moderne (`html/`)
- Synchronisation serveur/client pour les achats et l’inventaire
- Intégration facile avec les systèmes d’économie et d’inventaire
- Optimisé pour la performance et l’extensibilité

## 📦 Installation

1. Placez ce dossier dans le répertoire `resources` de votre serveur.
2. Ajoutez la ressource à votre `server.cfg` :
   ```
   ensure infinity_core         # Module Framework core
   ensure infinity_stores      # Module système de boutiques
   ```
3. Configurez les fichiers et items selon vos besoins dans `config.lua`.

## ⚙️ Configuration

- Scripts principaux :
  - `client.lua` (logique client)
  - `server.lua` (logique serveur)
  - `config.lua` (configuration magasins/items)
  - `dataview.lua` (gestion des données)
- Interface web : `html/`

## 🛠 Contribution

Toute contribution est la bienvenue !
Merci de créer une issue ou une pull request pour toute suggestion ou amélioration.

## 🤝 Support & liens

- Documentation : [https://altitude-dev.gitbook.io/doc/](https://altitude-dev.gitbook.io/doc/)
- Support Discord : [https://discord.gg/ncH7GX3XJd](https://discord.gg/ncH7GX3XJd)
- Auteurs : Shepard, iiRedDev

---

> Module sous licence ALTITUDE-DEV.COM. Toute reproduction ou distribution non autorisée est interdite.
