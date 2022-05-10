//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 08.05.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    
    
    var profilePhoto: UIImageView = {
        let profilePhoto = UIImageView()
        profilePhoto.image = UIImage(named: "fedor")
        // Размер
        profilePhoto.frame = CGRect(x: 16, y: 16, width: 140, height: 140)
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
    
    var profileName: UILabel = {
        let profileName = UILabel()
        profileName.frame = CGRect(x: 180, y: 27, width: 190, height: 30)
        profileName.font = UIFont(name: "Helvetica-Bold", size: 18)
        profileName.textColor = .black
        profileName.text = "Fedor Nazarenko"
        return profileName
    }()
    
    var userStatusLabel: UILabel = {
        let status = UILabel()
        status.frame = CGRect(x: 180, y: 115, width: 190, height: 30)
        status.font = UIFont(name: "Helvetica", size: 14)
        status.textColor = .systemGray
        status.text = "Hello world!"
        return status
    }()
    
    let userTextField: UITextField = {
        let text = UITextField()
        text.frame = CGRect(x: 180, y: 150, width: 140, height: 40)
        text.backgroundColor = .white
        text.font = UIFont(name: "Helvetica", size: 15)
        text.layer.cornerRadius = 12
        
        return text
    }()

    
    var userStatusButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 16, y: 205, width: 360, height: 50)
        
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
    
    // Инициализируем добавленные компоненты
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileName)
        addSubview(profilePhoto)
        addSubview(userStatusLabel)
        addSubview(userTextField)
        addSubview(userStatusButton)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc private func tapAction() {
  
        // Функция должна выводить в консоль текст из поля "статус".
//        let text = userStatusLabel.text
//        if text != nil {
//            print(text!)
//        } else {
//            print("Статус отсутствует.")
//        }
        
        // Измените функцию buttonPressed() так, чтобы при нажатии на кнопку введенный текст устанавливался в качестве статуса
        userStatusLabel.text = userTextField.text
        
    }
    
    
}
