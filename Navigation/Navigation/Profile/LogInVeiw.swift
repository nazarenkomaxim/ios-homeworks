//
//  LogInVeiw.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 13.05.2022.
//

import UIKit

class LogInVeiw: UIView {

    let logoView: UIImageView = {
        let view = UIImageView()
        view.toAutoLayout()

        view.image = UIImage(named: "logo")
        // Обрезать фото по радиусу
//        view.layer.masksToBounds = true

        return view
    }()
    
    var loginTextField: UITextField = {
        let text = UITextField()
        text.toAutoLayout()
        text.backgroundColor = .systemGray6
        text.font = UIFont(name: "Helvetica", size: 16)
        text.textAlignment = .center
        text.layer.cornerRadius = 12
        text.placeholder = "Введите почту или номер телефона"
        // Выравнивание по левому краю
        text.textAlignment = .left
        // Кнопка очистить при редактировании
        text.clearButtonMode = .whileEditing
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 0.5
        text.textColor = .black
        return text
    }()
    
    var passwordTextField: UITextField = {
        let text = UITextField()
        text.toAutoLayout()
        text.backgroundColor = .systemGray6
        text.font = UIFont(name: "Helvetica", size: 16)
        text.textAlignment = .center
        text.layer.cornerRadius = 12
        text.placeholder = "Ваш пароль"
        // Выравнивание по левому краю
        text.textAlignment = .left
        // Кнопка очистить при редактировании
        text.clearButtonMode = .whileEditing
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 0.5
        text.textColor = .black
        text.isSecureTextEntry = true
        return text
    }()
    
    lazy var loginBlueButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.setTitle("Вход", for: .normal)
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
        addSubview(logoView)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(loginBlueButton)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc private func tapAction() {

    }
    
    func setupViews() {
        // Для того, чтобы не добавлять много элементов в addSubview, можно создать замыкание:
        [logoView, loginTextField, passwordTextField, passwordTextField].forEach { self.addSubview($0) }
                
        NSLayoutConstraint.activate([
            // logoView
            logoView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120),
            logoView.bottomAnchor.constraint(equalTo: logoView.topAnchor, constant: 100),
            logoView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            logoView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 100),
            logoView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -100),
//            logoView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),

            // loginTextField
            loginTextField.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
            loginTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginTextField.bottomAnchor.constraint(equalTo: loginTextField.topAnchor, constant: 50),
            loginTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: -16),
            
            // passwordTextField
            passwordTextField.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 1),
            passwordTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),

            // loginBlueButton
            loginBlueButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            loginBlueButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginBlueButton.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            loginBlueButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: -16),
            
            
        ])
    }
    
    
}
