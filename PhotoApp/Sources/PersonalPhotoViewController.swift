//
//  PersonalPhotoViewController.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 03.09.2022.
//

import UIKit

class PersonalPhotoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        title = "Для Вас"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
