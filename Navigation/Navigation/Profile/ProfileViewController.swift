//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 05.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        // Оставил для примера данное свойство, а не метод
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Мой профиль"
        constraintHeaderView()
        view.backgroundColor = .lightGray
        profileHeaderView.setupViews()
    }
        
    private func constraintHeaderView() {
        view.addSubview(profileHeaderView)
        
        NSLayoutConstraint.activate([
            // profileHeaderView
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 220),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
        ])
    }
    
    
    
}
