//
//  LatestNewsModel.swift
//  ISNewsProject
//
//  Created by Marion Benarroche on 10/04/2023.
//

import Foundation

// Structure du retour de l'API
struct LatestNewsModel: Codable {
    // Statut de la demande ('ok' ou 'error')
    let status: String?
    // Nombre d'article trouvés
    let totalResults: Int
    // Liste des articles trouvés
    let articles: [Article]
    
    // Seulement en cas de status 'error'
    // Code de l'erreur retournée par l'API
    let code: String?
    // Message d'explication de l'erreur
    let message: String?
}

// Structure d'un article
struct Article: Codable {
    // Source de l'article
    let source: Source
    // Titre de l'article
    let title: String
    // URL de l'article sur le site d'ou il provient
    let url: String
    // Date de publication en UTC +0
    let publishedAt: String
    
    // Auteur de l'article
    let author: String?
    // Description ou résumé de l'article
    let description: String?
    // URL de l'image de l'article
    let urlToImage: String?
    // Contenu de l'article non formaté, tronqué à 200 caractères
    let content: String?
}

// Structure de la source d'un Article
struct Source: Codable {
    // Identifiant de la source
    let id: String?
    // Nom de la source
    let name: String
}
