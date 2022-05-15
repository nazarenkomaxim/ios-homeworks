//
//  NewsFeed.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 15.05.2022.
//

import UIKit

struct Post {
    let heading: String
    let description: String?
    let image: UIImage
    var likes: Int
    var views: Int
    
    static func makeNews() -> [Post] {
        var news = [Post]()
        
        news.append(Post(heading: "46 лет назад, 1 апреля 1976 года Стив Джобс, Стив Возняк и Рональд Вэйн основали компанию Apple Computer!", description: "Давайте окунёмся в историю и вспомним значимые событий этой замечательной компании, о которых вы могли не знать. Продолжение в следующей публикации.", image: UIImage(named: "appleComputers")!, likes: 18, views: 173))
        news.append(Post(heading: "1984 год Apple представила Macintosh", description: "Macintosh был первым персональным компьютером с графическим интерфейсом и управления при помощи мыши. Именно Macintosh можно назвать прародителем всех персональных компьютеров.", image: UIImage(named: "macintosh1984")!, likes: 9, views: 117))
        news.append(Post(heading: "1998 год. Apple представила iMac.", description: "Серия персональных компьютеров “всё в одном” с великолепным дизайном, который оставил далеко позади всех конкурентов и сделал огромный скачок в развитии индустрии. Современные модели iMac и сегодня являются эталоном компьютера “всё в одном”.", image: UIImage(named: "iMacG3")!, likes: 14, views: 141))
        news.append(Post(heading: "2001 год. Apple представила iPod.", description: "Серия портативных проигрывателей, которые изменили музыкальную индустрию и являлись одними из самых популярных устройств своего времени. Некоторые модели iPod имеют статус культовых, ими пользуются и в наше время.", image: UIImage(named: "iPod1st")!, likes: 13, views: 135))
        
        return news
    }
}
