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
    @IBOutlet weak var seeMoreLink: UILabel!
    
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

    // Configuration of the IBOutlets of the view with information of an Article
    func configView() {
        self.title = "Détail de l'article"
        titleLabel.text = viewModel.articleTitle
        ContentLabel.text = viewModel.articleContent
        imageView.load(url: viewModel.articleImage)
        
        // Enabled user interaction
        seeMoreLink.isUserInteractionEnabled = true
        
        // Create and add the gesture recognizer
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelClicked(_:)))
        seeMoreLink.addGestureRecognizer(gestureRecognizer)
        
        // Change text and color of label
        seeMoreLink.text = "Voir l'article en intégralité"
        seeMoreLink.textColor = .systemBlue
    }
    
    @objc func labelClicked(_ sender: UITapGestureRecognizer) {
        if let url = URL(string: viewModel.articleURL) {
            UIApplication.shared.open(url)
        }
    }
}
