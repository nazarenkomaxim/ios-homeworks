//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 20.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func customizeCell() {
        
        contentView.backgroundColor = .systemGreen
        contentView.layer.cornerRadius = 15
        
        
        
    }

    
    
    
}

