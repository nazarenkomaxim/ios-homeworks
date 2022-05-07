//
//  InfoViewController.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 06.05.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        makeButton()
    }
    
    private func makeButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center
        button.setTitle("Нажми", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10 // Скругление углов кнопки
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
    }
    @objc private func tapAction() {
        let alertAction = UIAlertController(title: "Важное сообщение", message: "Вы точно хотите выйти?", preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "Выйти", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
            print("Выходим")
        }
        let cancelAlertAction = UIAlertAction(title: "Отмена", style: .destructive) {_ in 
            print("Отмена, не выходим")
        }
        
        alertAction.addAction(cancelAlertAction)
        alertAction.addAction(okAlertAction)
        present(alertAction, animated: true)
    }
}
