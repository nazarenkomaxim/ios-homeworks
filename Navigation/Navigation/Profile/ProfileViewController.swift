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
        
        // Задаем frame, равный frame корневого view
        view.frame = view.safeAreaLayoutGuide.layoutFrame
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Мой профиль"
        setupViews()
        view.backgroundColor = .lightGray
    
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    private func setupViews() {
        view.addSubview(profileHeaderView)
        profileHeaderView.backgroundColor = .lightGray
        
        // Для того, чтобы не добавлять много элементов в addSubview, можно создать замыкание:
        [profileHeaderView.profilePhotoView, profileHeaderView.profileNameLabel, profileHeaderView.userStatusButton, profileHeaderView.userStatusLabel, profileHeaderView.userTextField].forEach { view.addSubview($0) }

        
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
            profileHeaderView.userStatusButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        // Текст статуса
        NSLayoutConstraint.activate([
            profileHeaderView.userStatusLabel.topAnchor.constraint(equalTo: profileHeaderView.userStatusButton.topAnchor, constant: -64),
            profileHeaderView.userStatusLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 176)
        ])
        
        // Поле для статуса
        NSLayoutConstraint.activate([

            profileHeaderView.userTextField.topAnchor.constraint(equalTo: profileHeaderView.userStatusButton.topAnchor, constant: -44),
            profileHeaderView.userTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 176),
            profileHeaderView.userTextField.bottomAnchor.constraint(equalTo: profileHeaderView.userStatusButton.topAnchor, constant: -10),
            profileHeaderView.userTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
            
            ])
        
    }

}
