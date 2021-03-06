//
//  LogInViewController.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 13.05.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    // Создаем экземпляр стандартного класса Notification Center (ловит изменения и сообщает их своим подписчикам)
    let notificationCenter = NotificationCenter.default
    
    enum LoginUser {
        static let login = "nm@mail.ru"
        static let password = "qwerty"
    }
    
    let alertAction: UIAlertController = {
        let alert = UIAlertController()
        let okAlert = UIAlertAction(title: "Ок", style: .cancel)
        alert.title = "Важное сообщение"
        alert.message = "Логин или пароль введены не правильно. Подсказка: nm@mail.ru / qwerty"
        alert.addAction(okAlert)
        return alert
    }()
    
    private lazy var warningLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.textColor = .systemRed
        label.alpha = 0
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    // Минимальное количество символов для пароля
    let minLength = 6
    
    // Создаем scrollView, для её работы требуется ещё одна view
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.toAutoLayout()
        return scrollView
    }()
    
    private let loginView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.backgroundColor = .white
        return view
    }()
    
    let logoView: UIImageView = {
        let view = UIImageView()
        view.toAutoLayout()
        view.image = UIImage(named: "logo")
        // Обрезать фото по радиусу
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var loginTextField: UITextField = {
        let text = UITextField()
        text.toAutoLayout()
        text.backgroundColor = .systemGray6
        text.font = UIFont.systemFont(ofSize: 16)
        text.textAlignment = .center
        text.layer.cornerRadius = 12
        text.layer.borderColor = UIColor.lightGray.cgColor
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 0.5
        text.placeholder = " Введите вашу почту"
        // Выравнивание по левому краю
        text.textAlignment = .left
        // Кнопка очистить при редактировании
        text.clearButtonMode = .whileEditing
        text.textColor = .black
        text.textContentType = .emailAddress
        text.autocapitalizationType = .none
        // Делегат нужен для подъема экрана во время появления клавиатуры
        //        text.delegate = self
        return text
    }()
    
    lazy var passwordTextField: UITextField = {
        let text = UITextField()
        text.toAutoLayout()
        text.backgroundColor = .systemGray6
        text.font = UIFont.systemFont(ofSize: 16)
        text.textAlignment = .center
        text.layer.cornerRadius = 12
        text.layer.borderColor = UIColor.lightGray.cgColor
        text.layer.cornerRadius = 10
        text.layer.borderWidth = 0.5
        text.placeholder = " Введите ваш пароль"
        // Выравнивание по левому краю
        text.textAlignment = .left
        // Кнопка очистить при редактировании
        text.clearButtonMode = .whileEditing
        text.textColor = .black
        text.isSecureTextEntry = true
        text.autocapitalizationType = .none
        text.textContentType = .password
        // Делегат нужен для подъема экрана во время появления клавиатуры
        //        text.delegate = self
        return text
    }()
    
    lazy var loginBlueButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.addTarget(self, action: #selector(moveToProfile), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.setTitle("Вход", for: .normal)
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowRadius = 1
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.setBackgroundImage(UIImage(named: "blue_pixel-2"), for: UIControl.State.normal)
        return button
    }()
    
    @objc func moveToProfile() {
        
        let profileVC = ProfileViewController()
        
        var loginError = false
        var passwordError = false
        
        let login = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        warningLabel.text = ""
        
        if login.isEmpty {
            loginError = true
            warningLabel.alpha = 1
            loginTextField.layer.borderColor = UIColor.systemRed.cgColor
            warningLabel.text = "Укажите пожалуйста почту"
        } else {
            loginError = false
            loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        if password.isEmpty {
            passwordError = true
            warningLabel.alpha = 1
            passwordTextField.layer.borderColor = UIColor.systemRed.cgColor
            warningLabel.text = "Введите пожалуйста пароль"
        } else if password.count < minLength {
            passwordError = true
            warningLabel.alpha = 1
            passwordTextField.layer.borderColor = UIColor.systemRed.cgColor
            warningLabel.text = "Пароль должен содержать минимум \(minLength) символов"
        } else {
            passwordError = false
            loginTextField.layer.borderColor = UIColor.lightGray.cgColor
            
        }
        
        if passwordError && loginError {
            warningLabel.alpha = 1
            warningLabel.text = "Почта и пароль введены некорректно"
        }
        
        if !loginError && !passwordError {
            if loginTextField.text == LoginUser.login && passwordTextField.text == LoginUser.password{
                passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
                loginTextField.layer.borderColor = UIColor.lightGray.cgColor
                navigationController?.pushViewController(profileVC, animated: true)
            } else {
                present(alertAction, animated: true)
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        setupView()
        
    }
    
    // Мы подписываемся под события с клавиатурой, но также надо от них отписаться в методе viewWillDisappear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // keyboardWillShowNotification - следи за "клавиатура должна появиться"
        notificationCenter.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        // keyboardWillHideNotification - следи за "клавиатура должна быть спрятана"
        notificationCenter.addObserver(self, selector: #selector(keyboadrdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // Отписываемся от событий с клавиатурой, сработает когда контроллер пропадет с экрана, делаем обратные действия - удаляем Observer. Иначе может возникнуть сильная ссылка и утечка памяти
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // Данный метод будет срабатывать когда клавиатура показалась
    @objc private func keyboardShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    // Данный метод будет срабатывать когда клавиатура скрылась
    @objc private func keyboadrdHide() {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private func setupView() {
        
        view.addSubviews(scrollView)
        
        scrollView.addSubview(loginView)
        
        [logoView, loginTextField, passwordTextField, loginBlueButton, warningLabel].forEach { loginView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            // scrollView
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            // warningLabel
            warningLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
            warningLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            
            // LogInVeiw
            loginView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            loginView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            loginView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            loginView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // logoView
            logoView.topAnchor.constraint(equalTo: loginView.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoView.centerXAnchor.constraint(equalTo: loginView.safeAreaLayoutGuide.centerXAnchor),
            logoView.heightAnchor.constraint(equalToConstant: 100),
            logoView.widthAnchor.constraint(equalToConstant: 100),
            
            // loginTextField
            loginTextField.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
            loginTextField.leadingAnchor.constraint(equalTo: loginView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            loginTextField.trailingAnchor.constraint(equalTo: loginView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // passwordTextField
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: loginView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: loginView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // loginBlueButton
            loginBlueButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 28),
            loginBlueButton.leadingAnchor.constraint(equalTo: loginView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginBlueButton.heightAnchor.constraint(equalToConstant: 50),
            loginBlueButton.trailingAnchor.constraint(equalTo: loginView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            loginBlueButton.bottomAnchor.constraint(equalTo: loginView.safeAreaLayoutGuide.bottomAnchor),
            
        ])
        
    }
    
}

// MARK: - UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let textFieldText = textField.text,
              let rangeOfTextToReplace = Range(range, in: textFieldText) else {
            return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 10
    }
    
    // Метод убирает клавиатуру, когда нажимаем на клавишу return на клавиатуре
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
