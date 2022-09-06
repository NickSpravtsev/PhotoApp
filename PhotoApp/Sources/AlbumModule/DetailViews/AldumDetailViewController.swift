//
//  AldumDetailViewController.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 07.09.2022.
//

import UIKit
import SnapKit

class AldumDetailViewController: UIViewController {

    // MARK: - Propierties

    var albumItems: [AlbumItem]?

    // MARK: - Outlets

    private lazy var albumCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AlbumCompositionalCell.self, forCellWithReuseIdentifier: AlbumCompositionalCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(albumCollectionView)
    }

    private func setupLayout() {
        albumCollectionView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(view)
        }
    }

}

// MARK: - Extensions

extension AldumDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumItems?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = albumCollectionView.dequeueReusableCell(withReuseIdentifier: AlbumCompositionalCell.identifier, for: indexPath) as? AlbumCompositionalCell
        cell?.albumItem = albumItems?[indexPath.row]
        return cell ?? UICollectionViewCell()
    }


}
