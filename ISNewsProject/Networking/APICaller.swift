//
//  APICaller.swift
//  ISNewsProject
//
//  Created by Marion Benarroche on 10/04/2023.
//

import Foundation
import SwiftUI

// Custom error management
enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    // Get all latest French news
    static func getLatestNews(
        completionHandler: @escaping (_ result: Result<LatestNewsModel, NetworkError>) -> Void
    ) {
        // First we check that we have an API key and URL in the constant file
        if NetworkConstants.shared.apiKey.isEmpty, NetworkConstants.shared.serverAddress.isEmpty {
            // If something is missing, we can't do anything
            print("API key or URL missing")
            return
        }
        
        // We build the API URL that we are going to use with the API adress, options that we want and API key
        let urlString = NetworkConstants.shared.serverAddress
        // We only want the latests French article
        + "top-headlines?country=fr&apiKey="
        + NetworkConstants.shared.apiKey
        
        // Construction of the URL
        guard let url = URL(string: urlString) else {
            // If there is a problem, we return a specific error
            completionHandler(Result.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            guard error == nil, let data = dataResponse else {
                return
            }

            do {
                // We decode the result of the request and send a success return
                let resultData = try JSONDecoder().decode(LatestNewsModel.self, from: data)
                completionHandler(.success(resultData))
            } catch {
                // If we catch an error, we print it and return a specific error
                print("error: ", error)
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
        
    }
}
