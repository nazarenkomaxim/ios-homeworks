//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 20.05.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    //    var arrayPhoto: [UIImage] {
    //        var array = [UIImage]()
    //        for i in 1...20 {
    //            array.append(UIImage(named: "\(i)")!)
    //        }
    //        return array
    //    }

    
    private lazy var photosCollection: UICollectionView = {
        // Вначале создаем layout
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.toAutoLayout()
        collection.backgroundColor = .systemBlue
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
}

// MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
}
