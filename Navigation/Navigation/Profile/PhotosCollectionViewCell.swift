//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 20.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeCell()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customizeCell() {
        contentView.backgroundColor = .systemGreen
        contentView.layer.cornerRadius = 15
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    func setupView(with photo: UIImage) {
        photoImageView.image = photo
    }

    private func layout() {
        contentView.addSubviews(photoImageView)
        
        NSLayoutConstraint.activate([
            // Фото
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            
            ])
        
    }
    
}

