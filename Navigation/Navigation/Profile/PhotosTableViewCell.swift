//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 17.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private let whiteView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private let firstImageView: UIImageView = {
        let view = UIImageView()
        view.toAutoLayout()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.backgroundColor = .black
        return view
    }()
    
    private let secondImageView: UIImageView = {
        let view = UIImageView()
        view.toAutoLayout()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.backgroundColor = .black
        return view
    }()
    
    private let thirdImageView: UIImageView = {
        let view = UIImageView()
        view.toAutoLayout()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.backgroundColor = .black
        return view
    }()

    private let fourthImageView: UIImageView = {
        let view = UIImageView()
        view.toAutoLayout()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.backgroundColor = .black
        return view
    }()
    
    private var viewsLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Фото"
        label.textColor = .black
        return label
    }()

    lazy var loginBlueButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.addTarget(self, action: #selector(moveToGallery), for: .touchUpInside)
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

    @objc func moveToGallery() {
//        let profileVC = ProfileViewController()
//        navigationController?.pushViewController(profileVC, animated: true)
    
    }

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        customizeCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Метод для настройки ячеек
//    func setupCell(_ post: Post) {
//        newsImageView.image = post.image
//        headingLabel.text = post.heading
//        descriptionLabel.text = post.description
//        likesLabel.text = likesLabel.text! + String(post.likes)
//        viewsLabel.text = viewsLabel.text! + String(post.views)
//
//    }
    
    private func customizeCell() {
        contentView.backgroundColor = .systemRed
        contentView.layer.cornerRadius = 10
    }
    
    
    private func layout() {
        // В UITableViewCell вместо view указываем contentView
//        [whiteView, headingLabel, newsImageView, descriptionLabel, likesLabel, viewsLabel].forEach { contentView.addSubview($0) }
        
//        NSLayoutConstraint.activate([
            // Фон
//            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
//            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
//            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
                        
//        ])
        
    }

    
    
    

}

