//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 20.05.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    var arrayPhoto: [UIImage] {
        var array = [UIImage]()
        for i in 1...20 {
            array.append(UIImage(named: "\(i)")!)
        }
        return array
    }
    
    
    private lazy var photosCollection: UICollectionView = {
        // Вначале создаем layout
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.toAutoLayout()
        collection.backgroundColor = .systemBlue
        collection.dataSource = self
        collection.delegate = self
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        return collection
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .systemCyan
        layout()
    }
    
    private func layout() {
        view.addSubviews(photosCollection)
        
        NSLayoutConstraint.activate([
            
            // photosCollection
            photosCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photosCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photosCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            photosCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            
        ])
    }
    
    
}

// MARK: - UICollectionViewDataSource

// Данный протокол отвечает за наполнение нашей таблицы, у него есть два обязательных метода. Их принято называть numberOfRowsInSection и cellForRowAt
extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Обращаемся к нашему массиву и говорим, что количество ячеек = count массива
        
        arrayPhoto.count
    }
    
    // cellForRowAt - просит вернуть от нас экземпляр ячейки, здесь происходит её настройка
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // UICollectionViewCell() - дефолтная пустая ячейка
        // Но нам надо зарегистрировать ячейку и скастить её до нашего класса.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout

// Подписываемся именно под DelegateFlowLayout, а не под Delegate.
// Здесь происходит кастомизация layout
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    // Создадим переменную с вычисляемым свойством (потому что в extension нельзя хранить свойства) которая будет равна нужным поинтам
    private var sideInset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Дополнительная настройка ячеек (каждая четвертая растягивалась до ширины collectionView)
        //        if indexPath.item % 4 == 0 {
        //            let width = collectionView.bounds.width - sideInset * 2
        //            return CGSize(width: width, height: width)
        //        } else {
        //            let width = (collectionView.bounds.width - sideInset * 5) / 4
        //            return CGSize(width: width, height: width)
        //        }
        
        // Вычисляем ширину коллекции (collectionView.bounds.width) и работаем с этим
        let width = (collectionView.bounds.width - sideInset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    // Три метода ниже для настройки расстояний между ячейками работают в связке вместе друг с другом
    // Метод отвечает за расстояние между ячейками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
    
    // Метод отвечает за расстояние между ячейками по вертикали, если его не вызвать, то по дефолту 10 point
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    
    // Указываем расстояние между секциями, оно работает в связке с методом insetForSectionAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
}

