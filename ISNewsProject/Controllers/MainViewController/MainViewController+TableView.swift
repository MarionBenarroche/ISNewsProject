//
//  MainViewController+TableView.swift
//  ISNewsProject
//
//  Created by Marion Benarroche on 10/04/2023.
//

import Foundation
import UIKit

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.backgroundColor = .clear
        
        self.registerCells()
    }
    
    func registerCells() {
        tableView.register(MainArticleCell.register(), forCellReuseIdentifier: MainArticleCell.identifier)
    }
    
    // Reload the data of the view
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainArticleCell.identifier, for: indexPath) as? MainArticleCell else {
            return UITableViewCell()
        }
        
        cell.setupCell(viewModel: self.cellDataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO Add an ID the the Article struc and use it to find the correct Article instead of the title
        let articleTitle = cellDataSource[indexPath.row].title
        self.openArticle(articleTitle: articleTitle)
    }
}

