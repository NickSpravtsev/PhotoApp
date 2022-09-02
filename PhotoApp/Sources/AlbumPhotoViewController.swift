//
//  ViewController.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 02.09.2022.
//

import UIKit
import SnapKit

class AlbumPhotoViewController: UIViewController {
    
    // MARK: - Outlets
    
    private lazy var albumPhotoCollectionalView: UICollectionView = {
        let layout = createCompositionalLayout()
        let collectionalView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionalView.register(PhotoCompositionalCell.self, forCellWithReuseIdentifier: PhotoCompositionalCell.identifier)
        collectionalView.delegate = self
        collectionalView.dataSource = self
        return collectionalView
    }()
    
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
        view.addSubview(albumPhotoCollectionalView)
    }
    
    private func setupLayout() {
        albumPhotoCollectionalView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(view)
        }
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectorIndex, _ in
            let albumItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
            let albumLayoutItem = NSCollectionLayoutItem(layoutSize: albumItemSize)
            albumLayoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            
            let albumGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.1), heightDimension: .fractionalWidth(1))
            let albumLayoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: albumGroupSize, subitem: albumLayoutItem, count: 2)
            //albumLayoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            
            let albumLayoutSection = NSCollectionLayoutSection(group: albumLayoutGroup)
            albumLayoutSection.orthogonalScrollingBehavior = .groupPaging
            
            return albumLayoutSection
        }
    }
    
    // MARK: - Actions
    
    @objc private func addBarButtonPressed() {
        print("Add bar button pressed")
    }
}

// MARK: - Extensions

extension AlbumPhotoViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = albumPhotoCollectionalView.dequeueReusableCell(withReuseIdentifier: PhotoCompositionalCell.identifier, for: indexPath)
        cell.backgroundColor = .systemGreen
        
        return cell
    }
}
