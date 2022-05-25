

import UIKit

class ProfileViewController: UIViewController {
    
    // Создаем UITableView
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.toAutoLayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.sectionFooterHeight = 4
        return tableView
    }()
    
    // Создаем константу, которая отвечает за новости и возвращает массив новостей
    private var news = Post.makeNews()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        self.title = "Мой профиль"
        view.backgroundColor = .white
        layout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func layout() {
        view.addSubviews(tableView)
        
        NSLayoutConstraint.activate([
            
            // tableViewPost
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // numberOfRowsInSection - отвечает за количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Обращаемся к нашему массиву и говорим, что количество ячеек = count массива
        
        if section == 0 {
            return 1
        } else {
            return news.count
        }
    }
    
    // cellForRowAt - просит вернуть от нас экземпляр ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(news[indexPath.row])
            cell.delegateTableCell = self            
            
            
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

// Здесь можно выставлять размер ячейки, нажатие на ячейку, добавлять header и footer
extension ProfileViewController: UITableViewDelegate {
    // Метод отвечает за высоту ячейку
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Если поставить цифру, то можно задать дефолтную высоту, допустим 100 или 200, но если надо чтобы таблица была динамической, то надо писать: (чтобы работало - элементы должны быть привязаны как к низу, так и к верху ячейки)
        if indexPath.section == 0 {
            return 140
        } else {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = ProfileHeaderView()
            header.setupViews()
            header.delegate = self

            return header
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let photosVC = PhotosViewController()
            navigationController?.pushViewController(photosVC, animated: true)
        }
        
    }
    
}

// MARK: - ProfileHeaderViewDelegate

// Мы можем реализовать код тут или в самой кнопке
extension ProfileViewController: ProfileHeaderViewDelegate {
    func buttonPressed(alert: UIAlertController) {
        present(alert, animated: true)
    }
    
}

// MARK: - PostTableCellDelegate

extension ProfileViewController: PostTableCellDelegate {
    func viewsPressed(cell: PostTableViewCell) {
        print("TAP VIEW")
        
        guard let index = self.tableView.indexPath(for: cell)?.row else { return }
        let indexPath = IndexPath(row: index, section: 1)
        news[indexPath.row].views += 1
        
        let newDetailView = NewsDetailView()
        view.addSubviews(newDetailView)
        newDetailView.toAutoLayout()
        
        let news = news[indexPath.row]
        let viewNews = Post(heading: news.heading, description: news.description, image: news.image, likes: news.likes, views: news.views)
        newDetailView.setupCell(viewNews)
        
        NSLayoutConstraint.activate([
            newDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newDetailView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
        tableView.reloadRows(at: [indexPath], with: .none)
        
        
//
//        let newDetailView = NewsDetailView()
//        newDetailView.toAutoLayout()
//
//        let post = news[indexPath.row]
        
        
//
//        NSLayoutConstraint.activate([
//            newDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            newDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            newDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            newDetailView.topAnchor.constraint(equalTo: view.topAnchor)
//        ])
//
        
//        let post = self.dataSource[indexPath.row]
        
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
//        cell.setupCell(news[indexPath.row])
//        cell.delegateTableCell = self
        
        

        



        
    }
    
    
    func likesPressed(cell: PostTableViewCell) {
        
        guard let index = tableView.indexPath(for: cell)?.row else { return }
        let indexPath = IndexPath(row: index, section: 1)
        news[indexPath.row].likes += 1
        tableView.reloadRows(at: [indexPath], with: .none)
        
        print("Tap Likes")
        
    }
    
}

