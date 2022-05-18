

import UIKit

class ProfileViewController: UIViewController {
    
    // Создаем UITableView
    private lazy var tableViewPost: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.toAutoLayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return tableView
    }()
    
    private lazy var tableViewPhotos: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.toAutoLayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        return tableView
    }()
    
    // Создаем константу, которая отвечает за новости и возвращает массив новостей
    private let news = Post.makeNews()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        self.title = "Мой профиль"
        layout()
        view.backgroundColor = .white
        
    }
    
    private func layout() {
        view.addSubviews(tableViewPost)
        view.addSubviews(tableViewPhotos)
        
        NSLayoutConstraint.activate([
            
            // tableViewPhotos
            tableViewPhotos.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableViewPhotos.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableViewPhotos.bottomAnchor.constraint(equalTo: tableViewPost.topAnchor, constant: -12),
            tableViewPhotos.heightAnchor.constraint(equalToConstant: 340),
            tableViewPhotos.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            // tableViewPost
            //            tableViewPost.topAnchor.constraint(equalTo: tableViewPhotos.topAnchor),
            tableViewPost.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableViewPost.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableViewPost.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            
        ])
    }
}


// MARK: - UITableViewDataSource
// Данный протокол отвечает за наполнение нашей таблицы, у него есть два обязательных метода. Их принято называть numberOfRowsInSection и cellForRowAt
extension ProfileViewController: UITableViewDataSource {
    // numberOfRowsInSection - отвечает за количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Обращаемся к нашему массиву и говорим, что количество ячеек = count массива
        switch tableView {
        case tableViewPost:
            let section = news.count
            return section
        case tableViewPhotos:
            let section = 1
            return section
        default:
            return .zero
        }
    }
    
    // cellForRowAt - просит вернуть от нас экземпляр ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case tableViewPost:
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(news[indexPath.row])
            return cell
        case tableViewPhotos:
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate

// Здесь можно выставлять размер ячейки, нажатие на ячейку, добавлять header и footer
extension ProfileViewController: UITableViewDelegate {
    // Метод отвечает за высоту ячейку
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Если поставить цифру, то можно задать дефолтную высоту, допустим 100 или 200, но если надо чтобы таблица была динамической, то надо писать: (чтобы работало - элементы должны быть привязаны как к низу, так и к верху ячейки)
        switch tableView {
        case tableViewPost:
            return UITableView.automaticDimension
        case tableViewPhotos:
            return 120
        default:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileHeaderView()
        header.setupViews()
        return header
    }
    
}
