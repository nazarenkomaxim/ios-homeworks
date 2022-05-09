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

        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        profileHeaderView.addSubview(profileHeaderView.profilePhoto)
        profileHeaderView.addSubview(profileHeaderView.profileName)
        profileHeaderView.addSubview(profileHeaderView.userStatusLabel)
        profileHeaderView.addSubview(profileHeaderView.userStatusButton)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // Задаем frame, равный frame корневого view
        profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame
        profileHeaderView.backgroundColor = .gray
    }
    
    
    
}
