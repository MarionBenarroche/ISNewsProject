//
//  APICaller.swift
//  ISNewsProject
//
//  Created by Marion Benarroche on 10/04/2023.
//

import Foundation
import SwiftUI

// Gestion customisée des erreur
enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    // Récupération des dernières news en Français
    static func getLatestNews(
        completionHandler: @escaping (_ result: Result<LatestNewsModel, NetworkError>) -> Void
    ) {
        // D'abord on vérifie que l'on a bien une clef et une adresse d'API définit dans les constante
        if NetworkConstants.shared.apiKey.isEmpty, NetworkConstants.shared.serverAddress.isEmpty {
            print("Clef de l'API ou adresse de l'API manquant")
            // Si on a pas ces deux informations, on ne peut rien faire
            return
        }
        
        // On construit un string avec l'URL que l'on va utiliser qui contient l'adresse de l'API, les options que l'on veut et la clef de l'API
        let urlString = NetworkConstants.shared.serverAddress
        // Ici on ne veut que les titres des articles en Français
        + "top-headlines?country=us&apiKey="
        + NetworkConstants.shared.apiKey
        
        // On récupère une URL
        guard let url = URL(string: urlString) else {
            // S'il y a un problème lorsque la récupération de l'URL, on retourne une erreur spécifique
            completionHandler(Result.failure(.urlError))
            return
        }
        
        print("URL \(url)")
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            guard error == nil, let data = dataResponse else {
                return
            }

            do {
                let resultData = try JSONDecoder().decode(LatestNewsModel.self, from: data)
                completionHandler(.success(resultData))
            } catch {
                print("error: ", error)
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}
