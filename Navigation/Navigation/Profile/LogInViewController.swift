//
//  LogInViewController.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 13.05.2022.
//

import Foundation
import UIKit

class LogInViewController: UIViewController {
    
    let loginView: LogInVeiw = {
        let view = LogInVeiw()
        view.toAutoLayout()
        view.backgroundColor = .white
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    private func setupView() {
        view.addSubview(loginView)
        
        NSLayoutConstraint.activate([
            // LogInVeiw
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
    }
    
}


