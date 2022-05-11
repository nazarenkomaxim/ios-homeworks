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
        profilePhoto.translatesAutoresizingMaskIntoConstraints = false
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
        profileName.translatesAutoresizingMaskIntoConstraints = false
        profileName.font = UIFont(name: "Helvetica-Bold", size: 18)
        profileName.textColor = .black
        profileName.text = "Fedor Nazarenko"
        return profileName
    }()
    
    var userStatusLabel: UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.font = UIFont(name: "Helvetica", size: 14)
        status.textColor = .systemGray
        status.text = "Hello world!"
        return status
    }()
    
    var userTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.font = UIFont(name: "Helvetica", size: 15)
        text.textAlignment = .center
        text.layer.cornerRadius = 12
        return text
    }()
    
    lazy var userStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
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
    
    var newUserButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

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
    
    @objc private func tapAction() {
        // Измените функцию buttonPressed() так, чтобы при нажатии на кнопку введенный текст устанавливался в качестве статуса
        userStatusLabel.text = userTextField.text
    }

    @objc private func tapNewAction() {
        
    }
    
    // Инициализируем добавленные компоненты
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileNameLabel)
        addSubview(profilePhotoView)
        addSubview(userStatusLabel)
        addSubview(userTextField)
        addSubview(userStatusButton)
        addSubview(newUserButton)
    }
//
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
//

    
    
}
