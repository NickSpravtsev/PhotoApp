//
//  PersonalPhotoViewController.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 03.09.2022.
//

import UIKit
import SnapKit

class PersonalPhotoViewController: UIViewController {

    // MARK: - Propierties

    private var personalPhotoItems: [[AlbumItem]]?

    // MARK: - Outlets

    private lazy var personalPhotoCollectionView: UICollectionView = {
        let layout = createCompositionalLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.register(PersonalPhotoCell.self, forCellWithReuseIdentifier: PersonalPhotoCell.identifier)
        collectionView.register(AlbumSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AlbumSectionHeader.identifier)

        collectionView.delegate = self
        collectionView.dataSource = self

        return collectionView
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Для Вас"
        navigationController?.navigationBar.prefersLargeTitles = true
        personalPhotoItems = AlbumItem.personalPhotoItems
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(personalPhotoCollectionView)
    }

    private func setupLayout() {
        personalPhotoCollectionView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(view)
        }
    }

    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectorIndex, _ in
            switch sectorIndex {
            case 0:
                let memoryItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
                let memoryLayoutItem = NSCollectionLayoutItem(layoutSize: memoryItemSize)
                memoryLayoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)

                let memoryGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 1.1), heightDimension: .fractionalWidth(1.25))
                let memoryLayoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: memoryGroupSize, subitem: memoryLayoutItem, count: 1)

                let memorySectionLayout = NSCollectionLayoutSection(group: memoryLayoutGroup)
                memorySectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 0)
                memorySectionLayout.orthogonalScrollingBehavior = .groupPaging

                let memorySectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
                let memorySectionHeaderLayout = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: memorySectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                memorySectionLayout.boundarySupplementaryItems = [memorySectionHeaderLayout]

                return memorySectionLayout
            case 1:
                let compilationItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
                let compilationLayoutItem = NSCollectionLayoutItem(layoutSize: compilationItemSize)
                compilationLayoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)

                let compilationGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 1.1), heightDimension: .fractionalWidth(1 / 1.1))
                let compilationLayoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: compilationGroupSize, subitem: compilationLayoutItem, count: 1)

                let compilationSectionLayout = NSCollectionLayoutSection(group: compilationLayoutGroup)
                compilationSectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 0)
                compilationSectionLayout.orthogonalScrollingBehavior = .groupPaging

                let compilationSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
                let compilationSectionHeaderLayout = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: compilationSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                compilationSectionLayout.boundarySupplementaryItems = [compilationSectionHeaderLayout]

                return compilationSectionLayout
            default:
                return nil
            }
        }
    }
}

// MARK: - Extensions

extension PersonalPhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return personalPhotoItems?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return personalPhotoItems?[section].count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = personalPhotoCollectionView.dequeueReusableCell(withReuseIdentifier: PersonalPhotoCell.identifier, for: indexPath) as? PersonalPhotoCell
        cell?.personlPhotoItem = personalPhotoItems?[indexPath.section][indexPath.row]
        return cell ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = personalPhotoCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AlbumSectionHeader.identifier, for: indexPath) as? AlbumSectionHeader
        
        switch indexPath.section {
        case 0:
            header?.sectionHeaderButton.isHidden = false
            header?.sectionHeaderLabel.text = "Воспоминания"
        case 1:
            header?.sectionHeaderButton.isHidden = true
            header?.sectionHeaderLabel.text = "Подборка фото"
        default:
            header?.sectionHeaderLabel.text = ""
        }

        return header ?? UICollectionReusableView()
    }
}
