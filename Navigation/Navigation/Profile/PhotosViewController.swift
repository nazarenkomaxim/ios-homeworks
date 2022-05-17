//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 17.05.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private var array: [Int] {
        var array = [Int]()
        for element in 0...19 {
            array.append(element)
        }
        return array
    }
    
    // Создаем коллекцию
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        // frame - zero, потом растянем его якорями. В collectionViewLayout передаем ранее созданный layout
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.toAutoLayout()
        collection.backgroundColor = .systemBlue
        // Подписываемся под протоколы dataSource и delegate
        collection.dataSource = self
        collection.delegate = self
        collection.register(PhotosTableViewCell.self, forCellWithReuseIdentifier: PhotosTableViewCell.identifier)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    private func layout() {
        view.addSubview(collectionView)
        
        
        NSLayoutConstraint.activate([
        
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            
        
        
        
        ])
        
        
        
        
        
    }
    
    
    
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

// MARK: - UICollectionViewFlowLayout
// Подписываемся именно под DelegateFlowLayout, а не под Delegate.
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        <#code#>
    }
    
}




