//
//  ViewController.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 02.09.2022.
//

import UIKit

class AlbumPhotoViewController: UIViewController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupNavigationBar()
        setupHierarchy()
        setupLayout()
    }

    // MARK: Setup

    private func setupNavigationBar() {
        title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonPressed))
    }

    private func setupHierarchy() {

    }

    private func setupLayout() {

    }

    // MARK: - Actions

    @objc private func addBarButtonPressed() {
        print("Add bar button pressed")
    }
}

