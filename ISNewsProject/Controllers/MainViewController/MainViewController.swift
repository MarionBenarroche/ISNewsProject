//
//  MainViewController.swift
//  ISNewsProject
//
//  Created by Marion Benarroche on 10/04/2023.
//

import UIKit

class MainViewController: UIViewController {

    // IBoutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // ViewModel
    var viewModel: MainViewModel = MainViewModel()
    
    // Variable
    var cellDataSource: [ArticleTableCellViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
       
        configView()
        bindViewModel()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.getData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getData()
    }
    
    // Configuration of the principal view
    func configView() {
        self.title = "IS News Project"
        
        // Setup of the TableView of the Article
        setupTableView()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            // Show an activity indicator when we load the data
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
    
    // Open the view of an Article
    func openArticle(articleTitle: String) {
        // Retrieve the Article with it name
        guard let article = viewModel.retriveArticle(with: articleTitle) else {
            return
        }
        
        // Construction of the view and the controller
        let articleViewModel = ArticleViewModel(article: article)
        let articleController = ArticleViewController(viewModel: articleViewModel)
        
        // And push the new view with an animation
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(articleController, animated: true)
        }
    }
}
