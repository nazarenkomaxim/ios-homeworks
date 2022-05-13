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
    
    var newUserButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.addTarget(self, action: #selector(tapNewAction), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.setTitle("New button", for: .normal)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.cornerRadius = 4
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Мой профиль"
        constraintHeaderView()
        view.backgroundColor = .lightGray
        profileHeaderView.setupViews()
    }
    
    @objc private func tapNewAction() {
        
    }
    
    private func constraintHeaderView() {
        // Для того, чтобы не добавлять много элементов в addSubview, можно создать замыкание:
        view.addSubview(profileHeaderView)
        view.addSubview(newUserButton)
        
        NSLayoutConstraint.activate([
            // profileHeaderView
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 220),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            // Новая кнопка
            newUserButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newUserButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            newUserButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    
    
}
