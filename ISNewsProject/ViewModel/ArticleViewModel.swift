//
//  ArticleViewModel.swift
//  ISNewsProject
//
//  Created by Marion Benarroche on 10/04/2023.
//

import Foundation

class ArticleViewModel {
    var article: Article
    
    var articleImage: String?
    var articleTitle: String
    var articleContent: String
    
    init(article: Article) {
        self.article = article
        
        self.articleTitle = article.title
        self.articleContent = article.content ?? "" // TODO Voir si on a le contenu ou s'il faut aller le chercher
        self.articleImage = article.urlToImage ?? ""
        
        // TODO Ajouter l'URL vers le site
    }
    
}
