//
//  ArticleTableCellViewModel.swift
//  ISNewsProject
//
//  Created by Marion Benarroche on 10/04/2023.
//

import Foundation

class ArticleTableCellViewModel {
    
    var title: String
    var date: String?
    var imageURL: String?
    
    init(article: Article) {
        self.title = article.title
        self.date = self.formatedDate(date: article.publishedAt)
        // TODO Mettre une image par défaut si pas d'image
        self.imageURL = article.urlToImage
    }
   
    // TODO Déplacer la méthode dans un fichier d'outils pour l'utiliser ailleurs
    private func formatedDate(date: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "FR-fr")
        dateFormatter.dateFormat = "dd/MM/yyy HH:mm"
        let formatedDate = dateFormatter.date(from: date)
        
        return dateFormatter.string(from: formatedDate ?? Date())
    }
}
