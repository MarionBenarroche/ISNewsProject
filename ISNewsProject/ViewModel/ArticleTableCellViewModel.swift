//
//  ArticleTableCellViewModel.swift
//  ISNewsProject
//
//  Created by Marion Benarroche on 10/04/2023.
//

import Foundation
import UIKit

class ArticleTableCellViewModel {
    
    var title: String
    var date: String?
    var imageURL: String?
    
    init(article: Article) {
        self.title = article.title
        let dateFormater = DateFormater()
        self.date = dateFormater.formateStringToFrenchFormat(date: article.publishedAt)
        // TODO Show a default image if the article have none
        self.imageURL = article.urlToImage
    }
   
}
