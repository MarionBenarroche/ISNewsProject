# ISNewsProject
Pour réaliser ce projet, je suis partie sur une structure MVVM avec une structure de fichier suivantes :
- Networking : Tout ce qui concerne l'API (Clef, URL, construction de la requête, ...)
- Extensions : Fichiers utilisés pour étendre des classes 
- Ressources : Fichier regroupant les ressources nécessaire aux projets (Police d'écriture, images, fichier JSON, ...)
- Classes : Fichier regroupant des classes utile à l'ensemble du projet
- Model : Fichiers de modèle
- Controlers : Fichiers de contrôleurs
- ViewModel : Fichies de view model
- View : Fichiers de vue


## Utilisation

Un clef de l'API [Newsapi](https://newsapi.org/) doit être créer et renseigné au niveau du fichier `NetworkConstants` pour que l'application fonctionne.

## Amélioration
- Meilleur interface
- Image par défaut lorsque l'article n'en possède pas
