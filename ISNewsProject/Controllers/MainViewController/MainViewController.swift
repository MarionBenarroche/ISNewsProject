//
//  MainViewController.swift
//  ISNewsProject
//
//  Created by Marion Benarroche on 10/04/2023.
//

import UIKit

class MainViewController: UIViewController {

    // IBoutlets
    // Liste des articles 
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // ViewModel
    var viewModel: MainViewModel = MainViewModel()
    
    // Variable
    var cellDataSource: [ArticleTableCellViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // On configure la vue principal
        configView()
        bindViewModel()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.getData()
    }
    
    
    // Configuration de la vue principal
    func configView() {
        // Modification de la vue principal
        self.title = "IS News Project"
        self.view.backgroundColor = .systemBlue
        
        // Configuration des TableView
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getData()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] article in
            guard let self = self, let article = article else {
                return
            }
            self.cellDataSource = article
            self.reloadTableView()
        }
    }
    
    func openArticle(articleTitle: String) {
        guard let article = viewModel.retriveArticle(with: articleTitle) else {
            return
        }
        
        let articleViewModel = ArticleViewModel(article: article)
        let articleController = ArticleViewController(viewModel: articleViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(articleController, animated: true)
        }
    }
}
