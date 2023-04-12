//
//  UIImageViewExtensions.swift
//  ISNewsProject
//
//  Created by Marion Benarroche on 10/04/2023.
//

import Foundation
import UIKit

extension UIImageView {
    // Load an image from a string URL
    func load(url: String?) {
        // Making sure we have a correct URL else return nothing
        guard let url = URL(string: url ?? "") else {
            return
        }
        
        // Get the image from the URL
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
