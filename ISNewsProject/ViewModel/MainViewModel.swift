//
//  MainViewModel.swift
//  ISNewsProject
//
//  Created by Marion Benarroche on 10/04/2023.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[ArticleTableCellViewModel]> = Observable(nil)
    var dataSource: LatestNewsModel?
    
    // Number of section of the table
    func numberOfSections() -> Int {
        // For the sake of this project, we don't use sections but we split Article by domains for exemple
        1
    }
    
    // Number of row of the section
    func numberOfRows(in section: Int) -> Int {
        // We show every Article we found in the same section
        self.dataSource?.totalResults ?? 0
    }
    
    // Getting the date of the API
    func getData() {
        if isLoading.value ?? true {
            // If we are already loading something, we don't do anything else
            return
        }
        // We mark the begining of the loading of the data
        isLoading.value = true
        
        // Call of the API
        APICaller.getLatestNews { [weak self] result in
            // The data have been loaded
            self?.isLoading.value = false
            
            // Depending of the result
            switch result {
            case .success(let data):
                // Update of the dataSource
                self?.dataSource = data
                self?.mapCellData()
            case .failure(let error):
                // Or we show the error
                print(error)
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.articles.compactMap({ArticleTableCellViewModel(article: $0)})
    }
    
    // Retrive of an Article by it's title
    func retriveArticle(with title: String) -> Article? {
        guard let article = dataSource?.articles.first(where: {$0.title == title}) else {
            return nil
        }
        return article
    }
}
