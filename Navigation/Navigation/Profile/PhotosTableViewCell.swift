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
        label.text = "Фото"
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
    
    
    //    override init(frame: CGRect) {
    //        super.init(frame: frame)
    //        customizeCell()
    //        layout()
    //        setupCell(image: arrayPhoto)
    //
    //    }
    
    
    //    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    //        super.init(style: style, reuseIdentifier: reuseIdentifier)
    //        layout()
    //        customizeCell()
    //    }
    
    
    
    //    var arrayPhoto: [UIImage] {
    //        var array = [UIImage]()
    //        for i in 1...20 {
    //            array.append(UIImage(named: "\(i)")!)
    //        }
    //        return array
    //    }
    
    
    // Метод для настройки ячеек
    //    func setupCell(image: [UIImage]) {
    //        var arrayPhoto: [UIImage] {
    //            var array = [UIImage]()
    //            for i in 1...4 {
    //                array.append(UIImage(named: "\(i)")!)
    //            }
    //            return array
    //        }
    //        imageViewPhotos.image: [UIImage] {
    //            var image = [UIImage]()
    //            for element in 1...20 {
    //                UIImage(named: "\(element)")
    //                image.append(element)
    //            }
    //            return image
    //        }
    
    //        imageView?.image = (UIImage(named: "1")!)
    //    }
    
    
    private func layout() {
        contentView.addSubviews(whiteView)
        
        [firstImageViewPhotos, secondImageViewPhotos, thirdImageViewPhotos, fourthImageViewPhotos, imageLabel, imageArrowRight].forEach { whiteView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            // Фон
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            // imageLabel
            imageLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 12),
            imageLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 12),
            imageLabel.heightAnchor.constraint(equalToConstant: 20),
//            imageLabel.bottomAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -12),
            
            // imageArrowRight
            imageArrowRight.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 12),
            imageArrowRight.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -12),
            imageArrowRight.centerYAnchor.constraint(equalTo: imageLabel.centerYAnchor),
            imageArrowRight.widthAnchor.constraint(equalToConstant: 20),
            
            // Первая фото
            firstImageViewPhotos.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: 12),
            firstImageViewPhotos.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 12),
            firstImageViewPhotos.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -12),
            firstImageViewPhotos.trailingAnchor.constraint(equalTo: secondImageViewPhotos.leadingAnchor, constant: -8),
            firstImageViewPhotos.widthAnchor.constraint(equalToConstant: 86),
            
            // Вторая фото
            secondImageViewPhotos.topAnchor.constraint(equalTo: firstImageViewPhotos.topAnchor),
            secondImageViewPhotos.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -12),
            secondImageViewPhotos.trailingAnchor.constraint(equalTo: thirdImageViewPhotos.leadingAnchor, constant: -8),
            secondImageViewPhotos.widthAnchor.constraint(equalToConstant: 86),
            
            // Третья фото
            thirdImageViewPhotos.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: 12),
            thirdImageViewPhotos.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -12),
            thirdImageViewPhotos.trailingAnchor.constraint(equalTo: fourthImageViewPhotos.leadingAnchor, constant: -8),
            thirdImageViewPhotos.widthAnchor.constraint(equalToConstant: 86),
            
            // Четвертая фото
            fourthImageViewPhotos.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: 12),
            fourthImageViewPhotos.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -12),
            fourthImageViewPhotos.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -8),
            fourthImageViewPhotos.widthAnchor.constraint(equalToConstant: 86),
            
            
            
        ])
        
    }
    
    
    
    
}

