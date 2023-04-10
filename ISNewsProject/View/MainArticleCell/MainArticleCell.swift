//
//  MainArticleCell.swift
//  ISNewsProject
//
//  Created by Marion Benarroche on 10/04/2023.
//

import UIKit

class MainArticleCell: UITableViewCell {
    
    public static var identifier: String = "MainArticleCell"
    
    public static func register() -> UINib {
        UINib(nibName: "MainArticleCell", bundle: nil)
    }

    // IBOutlets
    
    // Fond de chaque article
    @IBOutlet weak var backView: UIView!
    // Image d'un article
    @IBOutlet weak var articleImageView: UIImageView!
    // Date de l'article
    @IBOutlet weak var articleDateLabel: UILabel!
    // Titre d'un article
    @IBOutlet weak var articleNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Customisation du fond de chaque article avec une bordure arrondi
        backView.addBorder(color: .label, width: 1)
        backView.round(10)
        
        // Customisation de l'image de l'article
        articleImageView.round(5)
    }
    
    // Mise en place des données dans la vue
    func setupCell(viewModel: ArticleTableCellViewModel) {
        self.articleNameLabel.text = viewModel.title
        self.articleDateLabel.text = viewModel.date ?? ""
        self.articleImageView.load(url: viewModel.imageURL)
    }
    
}
