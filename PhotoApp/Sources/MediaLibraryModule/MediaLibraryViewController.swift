//
//  MediaLibraryViewController.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 03.09.2022.
//

import UIKit
import SnapKit

class MediaLibraryViewController: UIViewController {

    // MARK: - Outlets

    private lazy var mediaCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.register(MediaLibraryCell.self, forCellWithReuseIdentifier: MediaLibraryCell.identifier)

        collectionView.dataSource = self
        collectionView.delegate = self

        return collectionView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Медиатека"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(mediaCollectionView)
    }

    private func setupLayout() {
        mediaCollectionView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(view)
        }
    }
}

// MARK: - Extensions

extension MediaLibraryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mediaCollectionView.dequeueReusableCell(withReuseIdentifier: MediaLibraryCell.identifier, for: indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: view.frame.size.width - 40, height: view.frame.size.height / 3.5)
        return size
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 25
    }
}
