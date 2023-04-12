//
//  NetworkConstants.swift
//  ISNewsProject
//
//  Created by Marion Benarroche on 10/04/2023.
//

import Foundation

// Constant used for API call
class NetworkConstants {
    public static var shared: NetworkConstants = NetworkConstants()
    
    // API key of https://newsapi.org/
    // TODO An API key must be created and copied below
    public var apiKey: String = ""
    
    // API URL without options
    public var serverAddress: String = "https://newsapi.org/v2/"
   
}
