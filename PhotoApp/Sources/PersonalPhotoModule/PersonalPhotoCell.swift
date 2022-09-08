//
//  PersonalPhotoCell.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 08.09.2022.
//

import UIKit
import SnapKit

class PersonalPhotoCell: UICollectionViewCell {
    
    // MARK: - Propierties
    
    static let identifier = "PersonalPhotoCell"
    
    var personlPhotoItem: AlbumItem? {
        didSet {
            photoImageView.image = UIImage(named: personlPhotoItem?.imageName ?? "")
            nameLabel.text = personlPhotoItem?.name
        }
    }
    
    // MARK: Outlets
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray6
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        
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
        contentView.addSubview(photoImageView)
        contentView.addSubview(nameLabel)
    }
    
    private func setupLayout() {
        photoImageView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(contentView)
        }
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.bottom.equalTo(contentView).offset(-10)
        }
    }
}
