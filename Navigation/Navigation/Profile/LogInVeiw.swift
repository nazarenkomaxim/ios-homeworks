////
////  LogInVeiw.swift
////  Navigation
////
////  Created by Maksim Nazarenko on 13.05.2022.
////
//
//import UIKit
//
//class LogInVeiw: UIView {
//
//    let logoView: UIImageView = {
//        let view = UIImageView()
//        view.toAutoLayout()
//        view.image = UIImage(named: "logo")
//        // Обрезать фото по радиусу
//        view.layer.masksToBounds = true
//        return view
//    }()
//
//    lazy var loginTextField: UITextField = {
//        let text = UITextField()
//        text.toAutoLayout()
//        text.backgroundColor = .systemGray6
//        text.font = UIFont.systemFont(ofSize: 16)
//        text.textAlignment = .center
//        text.layer.cornerRadius = 12
//        text.layer.borderColor = UIColor.lightGray.cgColor
//        text.layer.cornerRadius = 10
//        text.layer.borderWidth = 0.5
//        text.placeholder = " Введите почту или номер телефона"
//        // Выравнивание по левому краю
//        text.textAlignment = .left
//        // Кнопка очистить при редактировании
//        text.clearButtonMode = .whileEditing
//        text.textColor = .black
//        text.autocapitalizationType = .none
//        // Делегат нужен для подъема экрана во время появления клавиаутыры
//        text.delegate = self
//        return text
//    }()
//
//    lazy var passwordTextField: UITextField = {
//        let text = UITextField()
//        text.toAutoLayout()
//        text.backgroundColor = .systemGray6
//        text.font = UIFont.systemFont(ofSize: 16)
//        text.textAlignment = .center
//        text.layer.cornerRadius = 12
//        text.layer.borderColor = UIColor.lightGray.cgColor
//        text.layer.cornerRadius = 10
//        text.layer.borderWidth = 0.5
//        text.placeholder = " Ваш пароль"
//        // Выравнивание по левому краю
//        text.textAlignment = .left
//        // Кнопка очистить при редактировании
//        text.clearButtonMode = .whileEditing
//        text.textColor = .black
//        text.isSecureTextEntry = true
//        text.autocapitalizationType = .none
//        // Делегат нужен для подъема экрана во время появления клавиаутыры
//        text.delegate = self
//        return text
//    }()
//
//    lazy var loginBlueButton: UIButton = {
//        let button = UIButton()
//        button.toAutoLayout()
//        button.addTarget(self, action: #selector(moveToProfile), for: .touchUpInside)
//        button.backgroundColor = .systemBlue
//        button.titleLabel?.textColor = .white
//        button.setTitle("Вход", for: .normal)
//        button.layer.shadowOffset = CGSize(width: 2, height: 2)
//        button.layer.shadowRadius = 1
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOpacity = 0.2
//        button.clipsToBounds = true
//        button.layer.cornerRadius = 10
//        button.setBackgroundImage(UIImage(named: "blue_pixel-2"), for: UIControl.State.normal)
//        return button
//    }()
//
//    // Инициализируем добавленные компоненты
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        addSubview(logoView)
//        addSubview(loginTextField)
//        addSubview(passwordTextField)
//        addSubview(loginBlueButton)
//        setupViews()
//
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//
//    @objc func moveToProfile() {
//
//        let profileVC = ProfileViewController()
//        let loginVC = LogInViewController()
//        loginVC.navigationController?.pushViewController(profileVC, animated: true)
//
//    }
//
//
//
//    func setupViews() {
//        // Для того, чтобы не добавлять много элементов в addSubview, можно создать замыкание:
//        [logoView, loginTextField, passwordTextField, loginBlueButton].forEach { self.addSubview($0) }
//
//        NSLayoutConstraint.activate([
//
//            // logoView
//            logoView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120),
//            logoView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
//            logoView.heightAnchor.constraint(equalToConstant: 100),
//            logoView.widthAnchor.constraint(equalToConstant: 100),
//
//            // loginTextField
//            loginTextField.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
//            loginTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            loginTextField.heightAnchor.constraint(equalToConstant: 50),
//            loginTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
//
//            // passwordTextField
//            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor),
//            passwordTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
//            passwordTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
//
//            // loginBlueButton
//            loginBlueButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
//            loginBlueButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            loginBlueButton.heightAnchor.constraint(equalToConstant: 50),
//            loginBlueButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            loginBlueButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
//
//        ])
//    }
//
//
//}
//
//// MARK: - UITextFieldDelegate
////
////extension LogInVeiw: UITextFieldDelegate {
////    // Метод убирает клавиатуру, когда нажимаем на клавишу return на клавиатуре
////    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
////        self.endEditing(true)
////        return true
////    }
////}
