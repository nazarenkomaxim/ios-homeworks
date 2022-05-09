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
        status.frame = CGRect(x: 180, y: 125, width: 190, height: 30)
        status.font = UIFont(name: "Helvetica", size: 14)
        status.textColor = .systemGray
        status.text = "Hello world!"
        return status
    }()
    
    var userStatusButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 16, y: 170, width: 360, height: 50)
        
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
    
    @objc private func tapAction() {
        
    }
    
}
