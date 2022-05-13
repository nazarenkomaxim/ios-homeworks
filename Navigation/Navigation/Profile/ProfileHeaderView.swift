//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 08.05.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    var profilePhotoView: UIImageView = {
        let profilePhoto = UIImageView()
        profilePhoto.toAutoLayout()
        profilePhoto.image = UIImage(named: "fedor")
        // Толщина рамки
        profilePhoto.layer.borderWidth = 3
        // Цвет рамки, кастим до cgColor
        profilePhoto.layer.borderColor = UIColor.white.cgColor
        // Радиус сглаживания, чтобы был круг делим на два
        profilePhoto.layer.cornerRadius = 70
        // Обрезать фото по радиусу
        profilePhoto.layer.masksToBounds = true
        return profilePhoto
    }()
    
    var profileNameLabel: UILabel = {
        let profileName = UILabel()
        profileName.toAutoLayout()
        profileName.font = UIFont(name: "Helvetica-Bold", size: 18)
        profileName.textColor = .black
        profileName.text = "Fedor Nazarenko"
        return profileName
    }()
    
    var userStatusLabel: UILabel = {
        let status = UILabel()
        status.toAutoLayout()
        status.font = UIFont(name: "Helvetica", size: 14)
        status.textColor = .systemGray
        status.text = "Hello world!"
        return status
    }()
    
    var userTextField: UITextField = {
        let text = UITextField()
        text.toAutoLayout()
        text.backgroundColor = .white
        text.font = UIFont(name: "Helvetica", size: 15)
        text.textAlignment = .center
        text.layer.cornerRadius = 12
        return text
    }()
    
    lazy var userStatusButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.setTitle("Show status", for: .normal)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.cornerRadius = 4
        return button
    }()

//     Инициализируем добавленные компоненты
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileNameLabel)
        addSubview(profilePhotoView)
        addSubview(userStatusLabel)
        addSubview(userTextField)
        addSubview(userStatusButton)
    }
    
    @objc private func tapAction() {
        // Измените функцию buttonPressed() так, чтобы при нажатии на кнопку введенный текст устанавливался в качестве статуса
        userStatusLabel.text = userTextField.text
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews() {
        // Для того, чтобы не добавлять много элементов в addSubview, можно создать замыкание:
        [profilePhotoView, profileNameLabel, userStatusButton, userStatusLabel, userTextField].forEach { self.addSubview($0) }
                
        NSLayoutConstraint.activate([
            // Фото профиля
            profilePhotoView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            profilePhotoView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            profilePhotoView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 160),
            profilePhotoView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 156),
        
        // Имя профиля
            profileNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            profileNameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 176),
            profileNameLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 47),
        
        // Кнопка статуса
            userStatusButton.topAnchor.constraint(equalTo: profilePhotoView.bottomAnchor, constant: 16),
            userStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            userStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
        
        // Текст статуса
            userStatusLabel.topAnchor.constraint(equalTo: userStatusButton.topAnchor, constant: -69),
            userStatusLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 176),
        
        // Поле для статуса
            userTextField.topAnchor.constraint(equalTo: userStatusButton.topAnchor, constant: -44),
            userTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 176),
            userTextField.bottomAnchor.constraint(equalTo: userStatusButton.topAnchor, constant: -10),
            userTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }

}





