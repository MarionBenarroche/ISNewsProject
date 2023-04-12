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
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleDateLabel: UILabel!
    @IBOutlet weak var articleNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.addBorder(color: .label, width: 1)
        backView.round(10)
        
        articleImageView.round(5)
    }
    
    // Setup the data of each cell
    func setupCell(viewModel: ArticleTableCellViewModel) {
        self.articleNameLabel.text = viewModel.title
        self.articleDateLabel.text = viewModel.date ?? ""
        self.articleImageView.load(url: viewModel.imageURL)
    }
}
