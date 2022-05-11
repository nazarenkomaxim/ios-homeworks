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
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Мой профиль"
        setupViews()
        view.backgroundColor = .lightGray
    }
    
    private func setupViews() {
        // Для того, чтобы не добавлять много элементов в addSubview, можно создать замыкание:
        [profileHeaderView, profileHeaderView.profilePhotoView, profileHeaderView.profileNameLabel, profileHeaderView.userStatusButton, profileHeaderView.userStatusLabel, profileHeaderView.userTextField, profileHeaderView.newUserButton].forEach { view.addSubview($0) }
        
        // profileHeaderView
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 220),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        // Фото профиля
        NSLayoutConstraint.activate([
            profileHeaderView.profilePhotoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileHeaderView.profilePhotoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            profileHeaderView.profilePhotoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 160),
            profileHeaderView.profilePhotoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 156)
        ])
        
        // Имя профиля
        NSLayoutConstraint.activate([
            profileHeaderView.profileNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 27),
            profileHeaderView.profileNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 176),
            profileHeaderView.profileNameLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 47)
        ])
        
        // Кнопка статуса
        NSLayoutConstraint.activate([
            profileHeaderView.userStatusButton.topAnchor.constraint(equalTo: profileHeaderView.profilePhotoView.bottomAnchor, constant: 16),
            profileHeaderView.userStatusButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            profileHeaderView.userStatusButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),

        ])
        
        // Текст статуса
        NSLayoutConstraint.activate([
            profileHeaderView.userStatusLabel.topAnchor.constraint(equalTo: profileHeaderView.userStatusButton.topAnchor, constant: -69),
            profileHeaderView.userStatusLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 176)
        ])
        
        // Поле для статуса
        NSLayoutConstraint.activate([
            
            profileHeaderView.userTextField.topAnchor.constraint(equalTo: profileHeaderView.userStatusButton.topAnchor, constant: -44),
            profileHeaderView.userTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 176),
            profileHeaderView.userTextField.bottomAnchor.constraint(equalTo: profileHeaderView.userStatusButton.topAnchor, constant: -10),
            profileHeaderView.userTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        // Новая кнопка
        NSLayoutConstraint.activate([
            profileHeaderView.newUserButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            profileHeaderView.newUserButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileHeaderView.newUserButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            
        ])
        
    }
    
}
