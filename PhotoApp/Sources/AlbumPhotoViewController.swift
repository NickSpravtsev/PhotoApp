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
        collectionalView.register(AlbumSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AlbumSectionHeader.identifier)
        collectionalView.delegate = self
        collectionalView.dataSource = self
        return collectionalView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            switch sectorIndex{
            case 0:
                let albumItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
                let albumLayoutItem = NSCollectionLayoutItem(layoutSize: albumItemSize)
                albumLayoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 10)
                
                let albumGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2), heightDimension: .fractionalWidth(1))
                let albumLayoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: albumGroupSize, subitem: albumLayoutItem, count: 2)
                
                let albumSectionLayout = NSCollectionLayoutSection(group: albumLayoutGroup)
                albumSectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 0)
                albumSectionLayout.orthogonalScrollingBehavior = .groupPaging
                
                let albumSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
                let albumSectionHeaderLayout = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: albumSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                albumSectionLayout.boundarySupplementaryItems = [albumSectionHeaderLayout]
                
                return albumSectionLayout
            case 1:
                let albumItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
                let albumLayoutItem = NSCollectionLayoutItem(layoutSize: albumItemSize)
                albumLayoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 10)
                
                let albumGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2), heightDimension: .fractionalWidth(1 / 2.2))
                let albumLayoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: albumGroupSize, subitem: albumLayoutItem, count: 1)
                
                let albumSectionLayout = NSCollectionLayoutSection(group: albumLayoutGroup)
                albumSectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)
                albumSectionLayout.orthogonalScrollingBehavior = .groupPaging
                
                let albumSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
                let albumSectionHeaderLayout = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: albumSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                albumSectionLayout.boundarySupplementaryItems = [albumSectionHeaderLayout]
                
                return albumSectionLayout
            default:
                return nil
            }
        }
    }
    
    // MARK: - Actions
    
    @objc private func addBarButtonPressed() {
        print("Add bar button pressed")
    }
}

// MARK: - Extensions

extension AlbumPhotoViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 9
        case 1:
            return 7
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = albumPhotoCollectionalView.dequeueReusableCell(withReuseIdentifier: PhotoCompositionalCell.identifier, for: indexPath)
        cell.backgroundColor = .systemGreen
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AlbumSectionHeader.identifier, for: indexPath) as? AlbumSectionHeader
        
        switch indexPath.section {
        case 0:
            header?.sectionHeaderLabel.text = "Мои альбомы"
        case 1:
            header?.sectionHeaderLabel.text = "Общие альбомы"
        default:
            header?.sectionHeaderLabel.text = ""
        }
        return header ?? UICollectionReusableView()
    }
}
