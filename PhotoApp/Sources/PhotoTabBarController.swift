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
        let mediaLibraryViewController = MediaLibraryViewController()
        let mediaLibraryTabBarItem = UITabBarItem(title: "Медиатека",
                                                  image: UIImage(systemName: "photo.fill.on.rectangle.fill"),
                                                  selectedImage: UIImage(systemName: "photo.fill.on.rectangle.fill"))
        mediaLibraryViewController.tabBarItem = mediaLibraryTabBarItem

        let personalPhotoViewController = PersonalPhotoViewController()
        let personalPhotoTabBarItem = UITabBarItem(title: "Для Вас",
                                                   image: UIImage(systemName: "heart.text.square.fill"),
                                                   selectedImage: UIImage(systemName: "heart.text.square.fill"))
        personalPhotoViewController.tabBarItem = personalPhotoTabBarItem

        let albumPhotoViewController = AlbumPhotoViewController()
        let albumPhotoTabBarItem = UITabBarItem(title: "Альбомы",
                                                image: UIImage(systemName: "rectangle.stack.fill"),
                                                selectedImage: UIImage(systemName: "rectangle.stack.fill"))
        albumPhotoViewController.tabBarItem = albumPhotoTabBarItem

        let searchPhotoViewController = SearchPhotoViewController()
        let searchPhotoTabBarItem = UITabBarItem(title: "Поиск",
                                                 image: UIImage(systemName: "magnifyingglass"),
                                                 selectedImage: UIImage(systemName: "magnifyingglass"))
        searchPhotoViewController.tabBarItem = searchPhotoTabBarItem

        let controllers = [mediaLibraryViewController, personalPhotoViewController, albumPhotoViewController, searchPhotoViewController]
        self.setViewControllers(controllers, animated: true)
        self.selectedIndex = 2
    }

}
