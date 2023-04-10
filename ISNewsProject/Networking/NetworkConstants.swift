//
//  NetworkConstants.swift
//  ISNewsProject
//
//  Created by Marion Benarroche on 10/04/2023.
//

import Foundation

class NetworkConstants {
    public static var shared: NetworkConstants = NetworkConstants()
    
    // Clef de l'API de https://newsapi.org/
    // TODO Faut pas mettre dans le git lui + dire dans le readMe qu'il faut une clef pour que ça fonctionne
    public var apiKey: String = "0442fa194d1f4f02b1894450a8607990"
    
    /*
     * Getter de l'adresse utilisé pour l'API
     */
    public var serverAddress: String = "https://newsapi.org/v2/"
   
}
