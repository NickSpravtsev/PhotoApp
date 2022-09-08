//
//  SearchPhotoViewController.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 03.09.2022.
//

import UIKit

class SearchPhotoViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Поиск"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
