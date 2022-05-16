//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 15.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private let whiteView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private let newsImageView: UIImageView = {
        let view = UIImageView()
        view.toAutoLayout()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.backgroundColor = .black
        return view
    }()
    
    private let headingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()
    
    private var likesLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Нравится: "
        label.textColor = .black

        return label
    }()

    private var viewsLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Просмотры: "
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
//        customizeCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Метод для настройки ячеек
    func setupCell(_ post: Post) {
        newsImageView.image = post.image
        headingLabel.text = post.heading
        descriptionLabel.text = post.description
        likesLabel.text = likesLabel.text! + String(post.likes)
        viewsLabel.text = viewsLabel.text! + String(post.views)
        
    }
    
    
    private func layout() {
        // В UITableViewCell вместо view указываем contentView
        [whiteView, headingLabel, newsImageView, descriptionLabel, likesLabel, viewsLabel].forEach { contentView.addSubview($0) }
                
        NSLayoutConstraint.activate([
            // Фон
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            
            // Заголовок новости
            headingLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 8),
            headingLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 8),
//            headingLabel.bottomAnchor.constraint(equalTo: newsImageView.topAnchor, constant: -8),
            headingLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -8),

//            headingLabel.widthAnchor.constraint(equalToConstant: 100),

            // Картинка
            newsImageView.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 8),
            newsImageView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 8),
            newsImageView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -8),
            newsImageView.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -10),
            newsImageView.heightAnchor.constraint(equalTo: newsImageView.heightAnchor),
//            newsImageView.widthAnchor.constraint(equalTo: whiteView.widthAnchor, constant: -10),
            

            // Описание новости
            descriptionLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -8),
            descriptionLabel.bottomAnchor.constraint(equalTo: likesLabel.topAnchor, constant: -8),
            
            // Лайки Int
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            likesLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 8),
//            likesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            likesLabel.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -8),
            
            // Просмотры Int
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
//            newsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            viewsLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -8),
            viewsLabel.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -8),




        
        ])
        
    }
    
    
    
}
