//
//  NewsDetailView.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 25.05.2022.
//

import UIKit

class NewsDetailView: UIView {
    
    var transparentView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.alpha = 1
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        let image = UIImage(systemName: "xmark")
        button.setBackgroundImage(image, for: .normal)
        button.alpha = 1
        button.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return button
    }()
    
    private let newsImageView: UIImageView = {
        let view = UIImageView()
        view.toAutoLayout()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    private let headingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func closeAction() {
        removeFromSuperview()
    }
    
    // Метод для настройки ячеек
    func setupCell(_ post: Post) {
        newsImageView.image = post.image
        headingLabel.text = post.heading
        descriptionLabel.text = post.description
    }
    
    private func layout() {
        [transparentView, headingLabel, newsImageView, descriptionLabel, closeButton, ].forEach { self.addSubview($0) }
        
        NSLayoutConstraint.activate([
            // Фон
            transparentView.topAnchor.constraint(equalTo: self.topAnchor),
            transparentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            transparentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            transparentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            // Close Button
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            closeButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            closeButton.widthAnchor.constraint(equalToConstant: 20),
            closeButton.heightAnchor.constraint(equalToConstant: 20),
            
            // Заголовок новости
            headingLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 4),
            headingLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            headingLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            //            headingLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -8),
            
            // Описание новости
            descriptionLabel.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            //            descriptionLabel.bottomAnchor.constraint(equalTo: newsImageView.topAnchor, constant: -4),
            
            // Картинка
            newsImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            newsImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 4),
            newsImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -4),
            //            newsImageView.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -8),
            newsImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            newsImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -4)
            
        ])
        
    }
}
