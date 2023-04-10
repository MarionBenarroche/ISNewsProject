//
//  ArticleViewController.swift
//  ISNewsProject
//
//  Created by Marion Benarroche on 10/04/2023.
//

import UIKit

class ArticleViewController: UIViewController {

    // IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ContentLabel: UILabel!
    
    // View Model
    var viewModel: ArticleViewModel
    
    init(viewModel: ArticleViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "ArticleViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }

    func configView() {
        self.title = "Détail de l'article"
        titleLabel.text = viewModel.articleTitle
        ContentLabel.text = viewModel.articleContent
        imageView.load(url: viewModel.articleImage)
    }
}
