//
//  PhotoView.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 26.05.2022.
//

import UIKit

protocol PhotoViewDelegate: AnyObject {
    func closePhoto(view: PhotoView)
}

class PhotoView: UIView {
    
    weak var photoViewDelegate: PhotoViewDelegate?


   lazy var photoImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.toAutoLayout()
        return image
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        let image = UIImage(systemName: "xmark")
        button.setBackgroundImage(image, for: .normal)
//        button.alpha = 0
        button.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return button
    }()
    
    @objc private func closeAction() {
        photoViewDelegate?.closePhoto(view: self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.toAutoLayout()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func layout() {

        [photoImageView, closeButton].forEach { self.addSubview($0) }
        
        NSLayoutConstraint.activate([
        
            // Фото
//            photoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            photoImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            photoImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            photoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            photoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            // Close button
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalToConstant: 20),
            closeButton.heightAnchor.constraint(equalToConstant: 20),
            
        
        ])

        
        
        
        
        
    }
    

    
    
    
}
