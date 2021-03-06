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
    
    private let firstImageViewPhotos: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "1")
        view.toAutoLayout()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        return view
    }()
    
    private let secondImageViewPhotos: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "2")
        view.toAutoLayout()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        return view
    }()
    
    private let thirdImageViewPhotos: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "3")
        view.toAutoLayout()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        return view
    }()
    
    private let fourthImageViewPhotos: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "4")
        view.toAutoLayout()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        return view
    }()
    
    private let imageArrowRight: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "arrow.right")
        view.toAutoLayout()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    private var imageLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "????????"
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //        customizeCell()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        contentView.addSubviews(whiteView)
        
        [firstImageViewPhotos, secondImageViewPhotos, thirdImageViewPhotos, fourthImageViewPhotos, imageLabel, imageArrowRight].forEach { whiteView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            // ??????
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            whiteView.heightAnchor.constraint(equalToConstant: 140),
            
            // imageLabel
            imageLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 12),
            imageLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 12),
            imageLabel.heightAnchor.constraint(equalToConstant: 20),
            
            // imageArrowRight
            imageArrowRight.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 12),
            imageArrowRight.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -12),
            imageArrowRight.centerYAnchor.constraint(equalTo: imageLabel.centerYAnchor),
            imageArrowRight.widthAnchor.constraint(equalToConstant: 20),
            
            // ???????????? ????????
            firstImageViewPhotos.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: 12),
            firstImageViewPhotos.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 12),
            firstImageViewPhotos.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -12),
            firstImageViewPhotos.trailingAnchor.constraint(equalTo: secondImageViewPhotos.leadingAnchor, constant: -8),
            firstImageViewPhotos.widthAnchor.constraint(equalToConstant: 86),
            
            // ???????????? ????????
            secondImageViewPhotos.topAnchor.constraint(equalTo: firstImageViewPhotos.topAnchor),
            secondImageViewPhotos.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -12),
            secondImageViewPhotos.trailingAnchor.constraint(equalTo: thirdImageViewPhotos.leadingAnchor, constant: -8),
            secondImageViewPhotos.widthAnchor.constraint(equalToConstant: 86),
            
            // ???????????? ????????
            thirdImageViewPhotos.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: 12),
            thirdImageViewPhotos.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -12),
            thirdImageViewPhotos.trailingAnchor.constraint(equalTo: fourthImageViewPhotos.leadingAnchor, constant: -8),
            thirdImageViewPhotos.widthAnchor.constraint(equalToConstant: 86),
            
            // ?????????????????? ????????
            fourthImageViewPhotos.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: 12),
            fourthImageViewPhotos.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -12),
            fourthImageViewPhotos.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -8),
            fourthImageViewPhotos.widthAnchor.constraint(equalToConstant: 86),
            
        ])
    }
    
}

