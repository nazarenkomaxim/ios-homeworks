//
//  PostViewController.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 05.05.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        self.navigationItem.title = "Мой пост"
        self.navigationItem.title = titlePost
        makeInfoButton()
        
        let postVC = PostViewController()
        
        let postNavigationVC = UINavigationController(rootViewController: postVC)

    }
    
    private func makeInfoButton() {
        let infoButton = UIBarButtonItem(title: "Информация", style: .plain, target: self, action: #selector(tapAction))
        navigationItem.rightBarButtonItem = infoButton
    }

    @objc private func tapAction() {
        let infoVC = InfoViewController()
        infoVC.title = "Инфо"
        navigationController?.pushViewController(infoVC, animated: true)
    }

   

}
