//
//  ViewController.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 02.09.2022.
//

import UIKit
import SnapKit

class AlbumPhotoViewController: UIViewController {

    // MARK: - Propierties

    private var albumItems: [[AlbumItem]]?
    private var photoTableItems: [[PhotoTableItem]]?
    
    // MARK: - Outlets
    
    private lazy var albumPhotoCollectionalView: UICollectionView = {
        let layout = createCompositionalLayout()
        let collectionalView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionalView.register(AlbumCompositionalCell.self, forCellWithReuseIdentifier: AlbumCompositionalCell.identifier)
        collectionalView.register(PhotoTableCell.self, forCellWithReuseIdentifier: PhotoTableCell.identifier)
        collectionalView.register(AlbumSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AlbumSectionHeader.identifier)
        collectionalView.delegate = self
        collectionalView.dataSource = self
        return collectionalView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        albumItems = AlbumItem.albumItems
        photoTableItems = PhotoTableItem.photoTableItems
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
                albumLayoutItem.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 10)
                
                let albumGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2), heightDimension: .fractionalWidth(1 * 1.15))
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
                albumLayoutItem.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 10)
                
                let albumGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2.2), heightDimension: .fractionalWidth(1 / 2.2 * 1.27))
                let albumLayoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: albumGroupSize, subitem: albumLayoutItem, count: 1)
                
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
            case 2, 3:
                let tableItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
                let tableLayoutItem = NSCollectionLayoutItem(layoutSize: tableItemSize)

                let tableGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(700))
                let tableLayoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: tableGroupSize, subitems: [tableLayoutItem])
                tableLayoutGroup.interItemSpacing = NSCollectionLayoutSpacing.fixed(5)

                let tableSectionLayout = NSCollectionLayoutSection(group: tableLayoutGroup)
                tableSectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20)

                let tableSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
                let tableSectionHeaderLayout = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: tableSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                tableSectionLayout.boundarySupplementaryItems = [tableSectionHeaderLayout]

                return tableSectionLayout
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
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0, 1:
            return albumItems?[section].count ?? 0
        case 2, 3:
            return photoTableItems?[section - 2].count ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section {
        case 0, 1:
            let cell = albumPhotoCollectionalView.dequeueReusableCell(withReuseIdentifier: AlbumCompositionalCell.identifier, for: indexPath) as? AlbumCompositionalCell
            cell?.albumItem = albumItems?[indexPath.section][indexPath.row]

            return cell ?? UICollectionViewCell()
        case 2, 3:
            let cell = albumPhotoCollectionalView.dequeueReusableCell(withReuseIdentifier: PhotoTableCell.identifier, for: indexPath) as? PhotoTableCell
            cell?.photoTableItem = photoTableItems?[indexPath.section - 2][indexPath.row]

            return cell ?? UICollectionViewCell()
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AlbumSectionHeader.identifier, for: indexPath) as? AlbumSectionHeader
        
        switch indexPath.section {
        case 0:
            header?.sectionHeaderLabel.text = "Мои альбомы"
            header?.sectionHeaderButton.isHidden = false
        case 1:
            header?.sectionHeaderLabel.text = "Общие альбомы"
            header?.sectionHeaderButton.isHidden = false
        case 2:
            header?.sectionHeaderLabel.text = "Типы медиафайлов"
            header?.sectionHeaderButton.isHidden = true
        case 3:
            header?.sectionHeaderLabel.text = "Другое"
            header?.sectionHeaderButton.isHidden = true
        default:
            header?.sectionHeaderLabel.text = ""
        }
        return header ?? UICollectionReusableView()
    }
}
