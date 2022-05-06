//
//  FeedViewController.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 05.05.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    let post = Post(title: "Мой пост")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        postButton()
    }
    
    // Создаем кнопку и не забываем добавить метод в viewDidLoad
    private func postButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center // Размещаем кнопку по центру экрана
        button.setTitle("Просмотреть", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10 // Скругление углов кнопки
        
        // Указываем, что должна делать кнопка при нажатии
        button.addTarget(self, action: #selector(viewPost), for: .touchUpInside)
        
        // Добавляем кнопку на View
        view.addSubview(button)
        
    }
    
    // Код для кнопки
    @objc private func viewPost() {
        let postVC = PostViewController() // Инициализируем
        // С помощью метода present вызываем postVC при нажатии на кнопку
//        present(postVC, animated: true)
        
        postVC.titlePost = post.title
        navigationController?.pushViewController(postVC, animated: true)
        
    }
    
}
