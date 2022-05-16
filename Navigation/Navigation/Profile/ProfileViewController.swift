

import UIKit

class ProfileViewController: UIViewController {
    
    // Создаем UITableView
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.toAutoLayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return tableView
    }()
        
    // Создаем константу, которая отвечает за новости и возвращает массив новостей
    private let news = Post.makeNews()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            navigationController?.navigationBar.isHidden = true

            self.title = "Мой профиль"
            constraintHeaderView()
            view.backgroundColor = .white
            
        }
    
        private func constraintHeaderView() {
            view.addSubview(tableView)
    
            NSLayoutConstraint.activate([
                // profileHeaderView
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
    
            ])
        }
}


// MARK: - UITableViewDataSource
    // Данный протокол отвечает за наполнение нашей таблицы, у него есть два обязательных метода. Их принято называть numberOfRowsInSection и cellForRowAt
extension ProfileViewController: UITableViewDataSource {
    // numberOfRowsInSection - отвечает за количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Обращаемся к нашему массиву и говорим, что количество ячеек = count массива
//        return carModel.count
        return news.count
    }
    // cellForRowAt - просит вернуть от нас экземпляр ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.setupCell(news[indexPath.row])
        return cell
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        news.count
//    }
}

// MARK: - UITableViewDelegate

// Здесь можно выставлять размер ячейки, нажатие на ячейку, добавлять header и footer
extension ProfileViewController: UITableViewDelegate {
    // Метод отвечает за высоту ячейку
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Если поставить цифру, то можно задать дефолтную высоту, допустим 100 или 200, но если надо чтобы таблица была динамической, то надо писать: (чтобы работало - элементы должны быть привязаны как к низу, так и к верху ячейки)
        
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileHeaderView()
        header.setupViews()
        
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? 220 : 0
//        UITableView.automaticDimension
    }
    
}
