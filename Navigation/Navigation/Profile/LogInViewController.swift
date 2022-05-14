//
//  LogInViewController.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 13.05.2022.
//

import Foundation
import UIKit

class LogInViewController: UIViewController {
    
    // Создаем экземпляр стандартного класса Notification Center (ловит изменения и сообщает их своим подписчикам)
    let notificationCenter = NotificationCenter.default
    
    // Создаем scrollView, для её работы требуется ещё одна view
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.toAutoLayout()
        return scrollView
    }()

    private let loginView: LogInVeiw = {
        let view = LogInVeiw()
        view.toAutoLayout()
        view.backgroundColor = .white
        return view
    }()
    
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
        
        NSLayoutConstraint.activate([
            // scrollView
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        scrollView.addSubview(loginView)
        
        NSLayoutConstraint.activate([
            // LogInVeiw
            loginView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            loginView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            loginView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            loginView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
    }
    
}


