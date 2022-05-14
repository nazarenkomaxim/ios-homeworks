//
//  AppDelegate.swift
//  Navigation
//
//  Created by Maksim Nazarenko on 05.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Задаем размер
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Window сделать видимым
        window?.makeKeyAndVisible()
        
        // Создаем экземпляр класса UITabBarController
        let tabBarController = UITabBarController()

        // Создаем два экземпляра класса VC
        let feedVC = FeedViewController()
        
        feedVC.tabBarItem.title = "Лента"
        feedVC.tabBarItem.image = UIImage(systemName: "house.fill")

        let profileVC = ProfileViewController()
        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        
        let loginVC: LogInViewController = {
            let loginVC = LogInViewController()
            loginVC.tabBarItem.title = "Профиль"
            loginVC.tabBarItem.image = UIImage(systemName: "person.crop.circle")
            return loginVC
        }()
        
        
        // Делаем экземпляр класса контроллера навигации
        let feedNavigationVC = UINavigationController(rootViewController: feedVC)
        let profileNavigationVC: UINavigationController = {
            let navigationController = UINavigationController(rootViewController: profileVC)
            return navigationController
        }()
        
        // Скрываем navigationBar на newProfileVC
//        profileNavigationVC.navigationBar.isHidden = true

        // Создаем массив контроллеров, которые будут отображаться
        tabBarController.viewControllers = [feedNavigationVC, profileNavigationVC]

        // Присваиваем для window VC
        self.window?.rootViewController = tabBarController

        return true
    }
    
    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

