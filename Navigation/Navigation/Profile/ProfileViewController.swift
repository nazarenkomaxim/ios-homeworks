//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 05.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Мой профиль"
        setupViews()
        view.backgroundColor = .lightGray
    
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // Задаем frame, равный frame корневого view
        profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame

    }
    
    private func setupViews() {
        view.addSubview(profileHeaderView)
        profileHeaderView.backgroundColor = .lightGray

    }

    
}
