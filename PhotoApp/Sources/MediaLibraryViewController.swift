//
//  MediaLibraryViewController.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 03.09.2022.
//

import UIKit

class MediaLibraryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        title = "Медиатека"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
