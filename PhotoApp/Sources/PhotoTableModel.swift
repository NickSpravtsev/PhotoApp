//
//  PhotoTableModel.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 05.09.2022.
//

import UIKit

struct PhotoTableItem {
    var imageName: String
    var name: String
    var count: Int
}

extension PhotoTableItem {
    static var photoTableItems: [[PhotoTableItem]] = [
        [PhotoTableItem(imageName: "video", name: "Видео", count: 15),
         PhotoTableItem(imageName: "person.crop.square", name: "Селфи", count: 120),
         PhotoTableItem(imageName: "livephoto", name: "Фото Live Photos", count: 5),
         PhotoTableItem(imageName: "cube", name: "Портреты", count: 7),
         PhotoTableItem(imageName: "pano", name: "Панорамы", count: 20),
         PhotoTableItem(imageName: "timelapse", name: "Таймлапс", count: 11),
         PhotoTableItem(imageName: "slowmo", name: "Замедленно", count: 9),
         PhotoTableItem(imageName: "camera.viewfinder", name: "Снимки экрана", count: 23),
         PhotoTableItem(imageName: "record.circle", name: "Записи экрана", count: 2)],
        [PhotoTableItem(imageName: "square.and.arrow.down", name: "Импортированные", count: 50),
         PhotoTableItem(imageName: "trash", name: "Недавно удаленные", count: 34)]
    ]
}
