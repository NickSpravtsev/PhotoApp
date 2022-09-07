//
//  AlbumModel.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 05.09.2022.
//

import Foundation

enum ImageType {
    case system
    case external
}

struct AlbumItem {
    var imageName: String
    var name: String
    var photoCount: Int
    var imageType: ImageType
}

extension AlbumItem {
    static var albumItems: [[AlbumItem]] = [[AlbumItem(imageName: "recentAlbumImage", name: "Недавние", photoCount: 1024, imageType: .external),
                                             AlbumItem(imageName: "favoritesAlbumImage", name: "Избранное", photoCount: 10, imageType: .external),
                                             AlbumItem(imageName: "whatsAppAlbumImage", name: "WhatsApp", photoCount: 5, imageType: .external),
                                             AlbumItem(imageName: "vacationAlbumImage", name: "Отпуск 2022", photoCount: 150, imageType: .external),
                                             AlbumItem(imageName: "newyearAlbumImage", name: "Новый год 2021", photoCount: 45, imageType: .external),
                                             AlbumItem(imageName: "wallpaperAlbumImage", name: "Обои", photoCount: 15, imageType: .external),
                                             AlbumItem(imageName: "carAlbumImage", name: "Авто", photoCount: 5, imageType: .external),
                                             AlbumItem(imageName: "forWorkAlbumImage", name: "Для работы", photoCount: 35, imageType: .external),
                                             AlbumItem(imageName: "natureAlbumImage", name: "Природа", photoCount: 32, imageType: .external)],
                                            [AlbumItem(imageName: "ItalyAlbumImage", name: "Италия 2017", photoCount: 120, imageType: .external),
                                             AlbumItem(imageName: "ThailandAlbumImage", name: "Таиланд 2019", photoCount: 150, imageType: .external),
                                             AlbumItem(imageName: "picturesAlbumImage", name: "Картинки", photoCount: 10, imageType: .external),
                                             AlbumItem(imageName: "photoshoot2021AlbumImage", name: "Фотосессия 2021", photoCount: 70, imageType: .external),
                                             AlbumItem(imageName: "photoshoot2022AlbumImage", name: "Фотосессия 2022", photoCount: 30, imageType: .external)],
                                            [AlbumItem(imageName: "video", name: "Видео", photoCount: 15, imageType: .system),
                                             AlbumItem(imageName: "person.crop.square", name: "Селфи", photoCount: 120, imageType: .system),
                                             AlbumItem(imageName: "livephoto", name: "Фото Live Photos", photoCount: 5, imageType: .system),
                                             AlbumItem(imageName: "cube", name: "Портреты", photoCount: 7, imageType: .system),
                                             AlbumItem(imageName: "pano", name: "Панорамы", photoCount: 20, imageType: .system),
                                             AlbumItem(imageName: "timelapse", name: "Таймлапс", photoCount: 11, imageType: .system),
                                             AlbumItem(imageName: "slowmo", name: "Замедленно", photoCount: 9, imageType: .system),
                                             AlbumItem(imageName: "camera.viewfinder", name: "Снимки экрана", photoCount: 23, imageType: .system),
                                             AlbumItem(imageName: "record.circle", name: "Записи экрана", photoCount: 2, imageType: .system)],
                                            [AlbumItem(imageName: "square.and.arrow.down", name: "Импортированные", photoCount: 50, imageType: .system),
                                             AlbumItem(imageName: "trash", name: "Недавно удаленные", photoCount: 34, imageType: .system)]]

    static var mediaLibraryItems: [AlbumItem] = [AlbumItem(imageName: "media-1", name: "2018", photoCount: 0, imageType: .external),
                                                 AlbumItem(imageName: "media-2", name: "2019", photoCount: 0, imageType: .external),
                                                 AlbumItem(imageName: "media-3", name: "2020", photoCount: 0, imageType: .external),
                                                 AlbumItem(imageName: "media-4", name: "2021", photoCount: 0, imageType: .external),
                                                 AlbumItem(imageName: "media-5", name: "2022", photoCount: 0, imageType: .external)]
}
