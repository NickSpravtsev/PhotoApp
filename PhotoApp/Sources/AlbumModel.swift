//
//  AlbumModel.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 05.09.2022.
//

import UIKit

struct AlbumItem {
    var image: UIImage
    var name: String
    var photoCount: Int

    init(imageName: String, name: String, photoCount: Int) {
        self.image = UIImage(named: imageName) ?? .remove
        self.name = name
        self.photoCount = photoCount
    }
}

extension AlbumItem {
    static var albumItems: [[AlbumItem]] = [
        [AlbumItem(imageName: "recentAlbumImage", name: "Недавние", photoCount: 1024),
         AlbumItem(imageName: "favoritesAlbumImage", name: "Избранное", photoCount: 10),
         AlbumItem(imageName: "whatsAppAlbumImage", name: "WhatsApp", photoCount: 5),
         AlbumItem(imageName: "vacationAlbumImage", name: "Отпуск 2022", photoCount: 150),
         AlbumItem(imageName: "newyearAlbumImage", name: "Новый год 2021", photoCount: 45),
         AlbumItem(imageName: "wallpaperAlbumImage", name: "Обои", photoCount: 15),
         AlbumItem(imageName: "carAlbumImage", name: "Авто", photoCount: 5),
         AlbumItem(imageName: "forWorkAlbumImage", name: "Для работы", photoCount: 35),
         AlbumItem(imageName: "natureAlbumImage", name: "Природа", photoCount: 32)],
        [AlbumItem(imageName: "ItalyAlbumImage", name: "Италия 2017", photoCount: 120),
         AlbumItem(imageName: "ThailandAlbumImage", name: "Таиланд 2019", photoCount: 150),
         AlbumItem(imageName: "picturesAlbumImage", name: "Картинки", photoCount: 10),
         AlbumItem(imageName: "photoshoot2021AlbumImage", name: "Фотосессия 2021", photoCount: 70),
         AlbumItem(imageName: "photoshoot2022AlbumImage", name: "Фотосессия 2022", photoCount: 30)]
    ]
}
