//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 08.05.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    var transparentView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.alpha = 0
        view.clipsToBounds = true
        view.backgroundColor = .black
        return view
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        let image = UIImage(systemName: "xmark")
        button.setBackgroundImage(image, for: .normal)
        button.alpha = 0
//        button.isHidden = true
        button.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return button
    }()

    var profilePhotoView: UIImageView = {
        let profilePhoto = UIImageView()
        profilePhoto.toAutoLayout()
        profilePhoto.image = UIImage(named: "fedor")
        // Толщина рамки
        profilePhoto.layer.borderWidth = 3
        // Цвет рамки, кастим до cgColor
        profilePhoto.layer.borderColor = UIColor.white.cgColor
        // Радиус сглаживания, чтобы был круг делим на два
        profilePhoto.layer.cornerRadius = 80
        // Обрезать фото по радиусу
        profilePhoto.layer.masksToBounds = true
        profilePhoto.isUserInteractionEnabled = true
        
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
    
    private var topProfileView = NSLayoutConstraint()
    private var leadingProfileView = NSLayoutConstraint()
    private var widthProfileView = NSLayoutConstraint()
    private var heightProfileView = NSLayoutConstraint()

    // Инициализируем добавленные компоненты
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileNameLabel)
        addSubview(profilePhotoView)
        addSubview(userStatusLabel)
        addSubview(userTextField)
        addSubview(userStatusButton)
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc private func tapAction() {
        userStatusLabel.text = userTextField.text
    }
    
    @objc private func closeAction() {
        NSLayoutConstraint.deactivate([
                        self.heightProfileView, self.widthProfileView
                    ])

        
        self.topProfileView = self.profilePhotoView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16)
        self.leadingProfileView = self.profilePhotoView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        self.widthProfileView = self.profilePhotoView.widthAnchor.constraint(equalToConstant: 160)
        self.heightProfileView = self.profilePhotoView.heightAnchor.constraint(equalToConstant: 160)
        self.layoutIfNeeded()
        

        
        UIView.animate(withDuration: 0.5) {
            self.transparentView.alpha = 0
            self.closeButton.alpha = 0
            self.profilePhotoView.layer.borderWidth = 3
            self.profilePhotoView.layer.cornerRadius = 80
            
            

           


        }
        
    }

    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapPhotoAction))
        profilePhotoView.addGestureRecognizer(tapGesture)
    }
    
    
    @objc private func tapPhotoAction() {
        self.heightProfileView.constant = UIScreen.main.bounds.height - 200
        self.widthProfileView.constant = UIScreen.main.bounds.width
//        self.profilePhotoView.center.x = UIScreen.main.bounds.width / 2
//        self.profilePhotoView.center.y = UIScreen.main.bounds.height / 2
//        NSLayoutConstraint.deactivate([
//            self.topProfileView, self.leadingProfileView
//        ])
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: .curveEaseInOut) {
//            self.heightProfileView.constant = UIScreen.main.bounds.height
            
//            self.widthProfileView.constant = UIScreen.main.bounds.width
            

            self.profilePhotoView.layer.borderWidth = 0
            self.profilePhotoView.layer.cornerRadius = 0
            self.transparentView.alpha = 0.9
            
            self.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.closeButton.alpha = 1.0
                
            }
        }

        
//        UIView.animate(withDuration: 3.0) {
//
//            self.leadingProfileView.constant = UIScreen.main.bounds.width - self.widthProfileView.constant
//            self.layoutIfNeeded()
//        } completion: { _ in
//
//        }

        print("Tap")
//        let rotateAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
//        rotateAnimation.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
//        rotateAnimation.fromValue = 0
//        rotateAnimation.toValue = 1.75 * Float.pi
//        
//        let positionAnimated = CABasicAnimation(keyPath: #keyPath(CALayer.position))
//        positionAnimated.fromValue = profilePhotoView.center
//        positionAnimated.toValue = CGPoint(x: UIScreen.main.bounds.width - 100, y: profilePhotoView.center.y)
//        
//        let groupAnimation = CAAnimationGroup()
//        groupAnimation.duration = 2.0
//        groupAnimation.animations = [rotateAnimation, positionAnimated]
//        groupAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//        profilePhotoView.layer.add(groupAnimation, forKey: nil)
        
    }

    
    
    
    func setupViews() {
        
//         Для того, чтобы не добавлять много элементов в addSubview, можно создать замыкание:
        [profileNameLabel, userStatusButton, userStatusLabel, userTextField,transparentView, profilePhotoView,  closeButton].forEach { self.addSubview($0) }
                
        topProfileView = profilePhotoView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        leadingProfileView = profilePhotoView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16)
        widthProfileView = profilePhotoView.widthAnchor.constraint(equalToConstant: 160)
        heightProfileView = profilePhotoView.heightAnchor.constraint(equalToConstant: 160)
        
        NSLayoutConstraint.activate([
//             Фото профиля
            topProfileView, leadingProfileView, widthProfileView, heightProfileView,
            
            // Прозрачный фон
            transparentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            transparentView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            transparentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            transparentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            transparentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
//            transparentView.bottomAnchor.constraint(equalTo: UIView.bottomAnchor),

            
            // close button
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40),
        
//         Имя профиля
            profileNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            profileNameLabel.leadingAnchor.constraint(equalTo: profilePhotoView.trailingAnchor, constant: 30),
            profileNameLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 47),

//         Кнопка статуса
            userStatusButton.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 16),
            userStatusButton.leadingAnchor.constraint(equalTo: profilePhotoView.trailingAnchor, constant: 30),
            userStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            userStatusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),

//         Текст статуса
            userStatusLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 40),
            userStatusLabel.leadingAnchor.constraint(equalTo: profilePhotoView.trailingAnchor, constant: 30),

//         Поле для статуса
            userTextField.topAnchor.constraint(equalTo: userStatusLabel.bottomAnchor, constant: 20),
            userTextField.leadingAnchor.constraint(equalTo: profilePhotoView.trailingAnchor, constant: 30),
//            userTextField.bottomAnchor.constraint(equalTo: userStatusButton.topAnchor, constant: -10),
            userTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            userStatusButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }

}





