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
        view.backgroundColor = .black
        view.layer.cornerRadius = 6
        return view
    }()
    
    private let secondImageViewPhotos: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "2")
        view.toAutoLayout()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.backgroundColor = .black
        return view
    }()
    
    private let thirdImageViewPhotos: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "3")
        view.toAutoLayout()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.backgroundColor = .black
        return view
    }()
    
    private let fourthImageViewPhotos: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "4")
        view.toAutoLayout()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.backgroundColor = .black
        return view
    }()

    
//    private let imageArrowRight: UIImageView = {
//        let view = UIImageView()
//        view.image = UIImage(systemName: "arrow.right")
//        view.toAutoLayout()
//        view.contentMode = .scaleAspectFit
//        view.clipsToBounds = true
//        return view
//    }()

//        private var imageLabel: UILabel = {
//            let label = UILabel()
//            label.toAutoLayout()
//            label.font = UIFont.boldSystemFont(ofSize: 24)
//            label.textColor = .black
//            label.text = "Фото"
//            label.textColor = .black
//            return label
//        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        customizeCell()
        layout()
        backgroundColor = .systemBlue
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

    
    
    private func customizeCell() {
        contentView.backgroundColor = .systemRed
//        contentView.layer.cornerRadius = 10
    }
    
    
    private func layout() {
        // В UITableViewCell вместо view указываем contentView
        
        [whiteView, firstImageViewPhotos, secondImageViewPhotos, thirdImageViewPhotos, fourthImageViewPhotos].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            // Фон
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
//            whiteView.heightAnchor.constraint(equalToConstant: 300),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            // Первая фото
            firstImageViewPhotos.topAnchor.constraint(equalTo: whiteView.topAnchor),
            firstImageViewPhotos.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor),
            firstImageViewPhotos.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor),
            firstImageViewPhotos.widthAnchor.constraint(equalToConstant: 20),
//            firstImageViewPhotos.heightAnchor.constraint(equalToConstant: 20),
            firstImageViewPhotos.trailingAnchor.constraint(equalTo: secondImageViewPhotos.leadingAnchor, constant: 8),
            
            // Вторая фото
            secondImageViewPhotos.topAnchor.constraint(equalTo: whiteView.topAnchor),
//            secondImageViewPhotos.leadingAnchor.constraint(equalTo: firstImageViewPhotos.leadingAnchor, constant: -8),
            secondImageViewPhotos.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor),
            firstImageViewPhotos.widthAnchor.constraint(equalToConstant: 20),

            secondImageViewPhotos.trailingAnchor.constraint(equalTo: thirdImageViewPhotos.leadingAnchor, constant: 8),
            
            // Третья фото
            thirdImageViewPhotos.topAnchor.constraint(equalTo: whiteView.topAnchor),
//            thirdImageViewPhotos.leadingAnchor.constraint(equalTo: secondImageViewPhotos.leadingAnchor, constant: -12),
            thirdImageViewPhotos.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor),
            firstImageViewPhotos.widthAnchor.constraint(equalToConstant: 20),

            thirdImageViewPhotos.trailingAnchor.constraint(equalTo: fourthImageViewPhotos.leadingAnchor, constant: 8),
            
            // Четвертая фото
            fourthImageViewPhotos.topAnchor.constraint(equalTo: whiteView.topAnchor),
//            fourthImageViewPhotos.leadingAnchor.constraint(equalTo: thirdImageViewPhotos.leadingAnchor, constant: -12),
            fourthImageViewPhotos.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor),
//            firstImageViewPhotos.widthAnchor.constraint(equalToConstant: 20),

            fourthImageViewPhotos.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -8),

            
        ])
        
    }
    
    
    
    
}

