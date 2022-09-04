//
//  PhotoTabBarController.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 03.09.2022.
//

import UIKit

class PhotoTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabBarController()
        setupTabBarViewControllers()
    }
    
    // MARK: - Setup
    
    private func setupTabBarController() {
        tabBar.backgroundColor = .systemGray6
    }
    
    private func setupTabBarViewControllers() {
        let mediaLibraryNavigationController = UINavigationController(rootViewController: MediaLibraryViewController())
        let mediaLibraryTabBarItem = UITabBarItem(title: "Медиатека",
                                                  image: UIImage(systemName: "photo.fill.on.rectangle.fill"),
                                                  selectedImage: UIImage(systemName: "photo.fill.on.rectangle.fill"))
        mediaLibraryNavigationController.tabBarItem = mediaLibraryTabBarItem
        
        let personalPhotoNavigationController = UINavigationController(rootViewController: PersonalPhotoViewController())
        let personalPhotoTabBarItem = UITabBarItem(title: "Для Вас",
                                                   image: UIImage(systemName: "heart.text.square.fill"),
                                                   selectedImage: UIImage(systemName: "heart.text.square.fill"))
        personalPhotoNavigationController.tabBarItem = personalPhotoTabBarItem
        
        let albumPhotoNavigationController = UINavigationController(rootViewController: AlbumPhotoViewController())
        let albumPhotoTabBarItem = UITabBarItem(title: "Альбомы",
                                                image: UIImage(systemName: "rectangle.stack.fill"),
                                                selectedImage: UIImage(systemName: "rectangle.stack.fill"))
        albumPhotoNavigationController.tabBarItem = albumPhotoTabBarItem
        
        let searchPhotoNavigationController = UINavigationController(rootViewController: SearchPhotoViewController())
        let searchPhotoTabBarItem = UITabBarItem(title: "Поиск",
                                                 image: UIImage(systemName: "magnifyingglass"),
                                                 selectedImage: UIImage(systemName: "magnifyingglass"))
        searchPhotoNavigationController.tabBarItem = searchPhotoTabBarItem
        
        let controllers = [mediaLibraryNavigationController,
                           personalPhotoNavigationController,
                           albumPhotoNavigationController,
                           searchPhotoNavigationController]
        self.setViewControllers(controllers, animated: true)
        self.selectedIndex = 2
    }
    
}
