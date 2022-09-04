//
//  PhotoCompositionalCell.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 03.09.2022.
//

import UIKit
import SnapKit

class AlbumCompositionalCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "AlbumCompositionalCell"

    var albumItem: AlbumItem? {
        didSet {
            albumImageView.image = albumItem?.image
            albumNameLabel.text = albumItem?.name
            photoCountLabel.text = String(albumItem?.photoCount ?? 0)
        }
    }

    // MARK: - Outlets

    private lazy var albumImageView: UIImageView = {
        let imageView = UIImageView()

        return imageView
    }()

    private lazy var albumNameLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    private lazy var photoCountLabel: UILabel = {
        let label = UILabel()

        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        contentView.addSubview(albumImageView)
        contentView.addSubview(albumNameLabel)
        contentView.addSubview(photoCountLabel)
    }

    private func setupLayout() {
        albumImageView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(contentView)
        }
        albumNameLabel.snp.makeConstraints { make in
            make.left.bottom.equalTo(contentView)
        }
        photoCountLabel.snp.makeConstraints { make in
            make.right.bottom.equalTo(contentView)
        }
    }
}
