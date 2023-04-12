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
    var articleURL : String
    
    init(article: Article) {
        self.article = article
        
        self.articleTitle = article.title
        self.articleContent = article.description ?? ""
        self.articleImage = article.urlToImage ?? ""
        self.articleURL = article.url
    }
    
}
