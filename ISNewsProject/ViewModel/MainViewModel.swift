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
    
    // Nombre de section de la TableView
    func numberOfSections() -> Int {
        1
    }
    
    // Nombre de ligne par section de la TableView
    func numbreOfRows(in section: Int) -> Int {
        self.dataSource?.totalResults ?? 0
    }
    
    func getData() {
        if isLoading.value ?? true {
            // Si on est déjà en train de télécharger quelque chose, on ne fait rien d'autre
            return
        }
        // On démarre le chargement des données
        isLoading.value = true
        
        APICaller.getLatestNews { [weak self] result in
            // Les données on été téléchargées
            self?.isLoading.value = false
            
            // En fonction du résultat obtenue
            switch result {
            case .success(let data):
                // On met à jour les dataSource
                self?.dataSource = data
                self?.mapCellData()
            case .failure(let error):
                // Ou on affiche l'erreur
                print(error)
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.articles.compactMap({ArticleTableCellViewModel(article: $0)})
    }
    
    func retriveArticle(with title: String) -> Article? {
        guard let article = dataSource?.articles.first(where: {$0.title == title}) else {
            return nil
        }
        return article
    }
}
