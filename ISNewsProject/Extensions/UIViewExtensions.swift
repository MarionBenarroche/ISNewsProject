//
//  UIViewExtensions.swift
//  ISNewsProject
//
//  Created by Marion Benarroche on 10/04/2023.
//

import Foundation
import UIKit

extension UIView {
    // Make a UIView with a rounded corner
    func round(_ radius: CGFloat = 10) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    // Add a border to a UIView
    func addBorder(color: UIColor, width: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
