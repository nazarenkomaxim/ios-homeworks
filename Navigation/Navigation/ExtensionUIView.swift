//
//  ExtensionUIView.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 11.05.2022.
//

import Foundation
import UIKit

public extension UIView {
    
    // Берём из класса - название нашего класса
    static var identifier: String {
        return String(describing: self)
    }
    
    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}

public extension String {
    func matches(_ regex: String) -> Bool {
        return
    }
}
