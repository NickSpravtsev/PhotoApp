//
//  MediaLibraryCell.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 08.09.2022.
//

import UIKit
import SnapKit

class MediaLibraryCell: UICollectionViewCell {

    // MARK: - Propierties
    static let identifier = "MediaLibraryCell"

    var cellItem: AlbumItem? {
        didSet {
            photoImageView.image = UIImage(named: cellItem?.imageName ?? "")
            nameLabel.text = cellItem?.name
        }
    }

    // MARK: Outlets

    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15

        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .white

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

    // MARK: Setup

    private func setupHierarchy() {
        contentView.addSubview(photoImageView)
        contentView.addSubview(nameLabel)
    }

    private func setupLayout() {
        photoImageView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(contentView)
        }

        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(20)
            make.top.equalTo(contentView).offset(10)
        }
    }

}
