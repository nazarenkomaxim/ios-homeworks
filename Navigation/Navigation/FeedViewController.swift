//
//  FeedViewController.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 05.05.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    let post = Post(title: "Мой пост")
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        stackViewSetup()

    }
        
    lazy var firstFeedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(firstAction), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.setTitle("Профиль", for: .normal)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.cornerRadius = 4
        return button
    }()
    
    lazy var secondFeedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(secondAction), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.setTitle("Tap me", for: .normal)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.cornerRadius = 4
        return button
    }()
    
    @objc private func firstAction() {
        let profileVC = ProfileViewController()
//        profileVC.titlePost = post.title
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    @objc private func secondAction() {
        let postVC = PostViewController()
        postVC.titlePost = post.title
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    private func stackViewSetup() {
        view.addSubview(stackView)
        
        // Когда добавляем элементы на stackView надо использовать addArrangedSubview
        [firstFeedButton, secondFeedButton].forEach { stackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            // Располагаем по центру экрана
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
