//
//  ExtensionUIView.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 11.05.2022.
//

import Foundation
import UIKit

public extension UIView {
    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
