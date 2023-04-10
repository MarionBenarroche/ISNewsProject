//
//  NetworkConstants.swift
//  ISNewsProject
//
//  Created by Marion Benarroche on 10/04/2023.
//

import Foundation

class NetworkConstants {
    public static var shared: NetworkConstants = NetworkConstants()
    
    /*
     * Getter de la clef de l'API
     */
    public var apiKey: String {
        get {
            // Clef de l'API de https://newsapi.org/
            return "0442fa194d1f4f02b1894450a8607990"
        }
    }
    
    /*
     * Getter de l'adresse utilisé pour l'API
     */
    public var serverAddress: String {
        get {
            return "https://newsapi.org/v2/"
        }
    }
   
}
