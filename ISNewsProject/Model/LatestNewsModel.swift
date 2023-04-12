//
//  LatestNewsModel.swift
//  ISNewsProject
//
//  Created by Marion Benarroche on 10/04/2023.
//

import Foundation

// Struc of the API return's data
struct LatestNewsModel: Codable {
    // Statut of the request ('ok' or 'error')
    let status: String?
    // Number of article found
    let totalResults: Int
    // List of the article dound
    let articles: [Article]
    
    // Only if statut equals 'error'
    // Error code return by the API
    let code: String?
    // Exclpication of the error
    let message: String?
}

// Struc of an article
struct Article: Codable {
    // Source of the article
    let source: Source
    // Title of the article
    let title: String
    // URL where the article came from
    let url: String
    // Date of publication in UTC+0
    let publishedAt: String
    
    // Author of the article
    let author: String?
    // Resume of the article
    let description: String?
    // URL of the image of the article
    let urlToImage: String?
    // Content of ther article non formated, truncated at 200 caracteres
    let content: String?
}

// Struc of the source of the Article
struct Source: Codable {
    // ID of the source
    let id: String?
    // Name of the source
    let name: String
}
