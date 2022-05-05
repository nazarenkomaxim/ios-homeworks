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
        self.navigationItem.title = titlePost
    }
    

   

}
